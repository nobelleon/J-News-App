import 'package:flutter/material.dart';
import 'package:j_news_app/bloc/get_sumber_berita_bloc.dart';
import 'package:j_news_app/elements/loader.dart';
import 'package:j_news_app/layar/detail_berita.dart';
import 'package:j_news_app/model/artikel.dart';
import 'package:j_news_app/model/respon_artikel.dart';
import 'package:j_news_app/model/sumber.dart';
import 'package:j_news_app/style/warna.dart' as Style;
import 'package:timeago/timeago.dart' as timeago;

class DetailSumber extends StatefulWidget {
  final Sumber sumber;

  const DetailSumber({Key key, this.sumber}) : super(key: key);

  @override
  _DetailSumberState createState() => _DetailSumberState(sumber);
}

class _DetailSumberState extends State<DetailSumber> {
  final Sumber sumber;

  _DetailSumberState(this.sumber);

  @override
  void initState() {
    super.initState();
    getSumberBeritaBloc..getSumberBerita(sumber.id);
  }

  @override
  void dispose() {
    getSumberBeritaBloc.drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: Style.Warna.mainColor,
          title: new Text(
            "",
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            color: Style.Warna.mainColor,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Hero(
                  tag: sumber.id,
                  child: SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: Container(
                      //------------
                      // Image Logo
                      //------------
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.white),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/logo/${sumber.id}.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                //--------------
                // Nama Channel
                //--------------
                Text(
                  sumber.nama,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                //-------------
                // Deskripsi
                //-------------
                Text(
                  sumber.deskripsi,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<ResponArtikel>(
              stream: getSumberBeritaBloc.subject.stream,
              builder: (context, AsyncSnapshot<ResponArtikel> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    return Container();
                  }
                  return _bangunWidgetSumberBerita(snapshot.data);
                } else if (snapshot.hasError) {
                  return Container();
                } else {
                  return bangunWidgetLoading();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bangunWidgetSumberBerita(ResponArtikel data) {
    List<Artikel> articles = data.artikels;

    if (articles.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Tidak ada berita lagi",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //-------------------
              // Ke Detail Berita
              //-------------------
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailBerita(
                    artikel: articles[index],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[200], width: 1.0),
                ),
                color: Colors.white,
              ),
              height: 150,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                    width: MediaQuery.of(context).size.width * 3 / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(articles[index].judul,
                            maxLines: 3,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14.0)),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      timeUntil(DateTime.parse(
                                          articles[index].tanggal)),
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    width: MediaQuery.of(context).size.width * 2 / 5,
                    height: 130,
                    child: FadeInImage.assetNetwork(
                        alignment: Alignment.topCenter,
                        placeholder: 'assets/image/placeholder.jpg',
                        image: articles[index].img == null
                            ? "http://to-let.com.bd/operator/images/noimage.png"
                            : articles[index].img,
                        fit: BoxFit.fitHeight,
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height * 1 / 3),
                  ),
                ],
              ),
            ),
          );
        },
      );
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
