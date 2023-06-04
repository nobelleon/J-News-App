import 'package:flutter/material.dart';
import 'package:j_news_app/bloc/get_berita_pilihan_bloc.dart';
import 'package:j_news_app/elements/error.dart';
import 'package:j_news_app/elements/loader.dart';
import 'package:j_news_app/layar/detail_berita.dart';
import 'package:j_news_app/model/artikel.dart';

import 'package:j_news_app/model/respon_artikel.dart';
import 'package:j_news_app/style/warna.dart' as Style;
import 'package:timeago/timeago.dart' as timeago;

class BeritaPilihan extends StatefulWidget {
  @override
  _BeritaPilihanState createState() => _BeritaPilihanState();
}

class _BeritaPilihanState extends State<BeritaPilihan> {
  @override
  void initState() {
    super.initState();
    getBeritaPilihanBloc..getBeritaPilihan();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ResponArtikel>(
      stream: getBeritaPilihanBloc.subject.stream,
      builder: (context, AsyncSnapshot<ResponArtikel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return bangunWidgetError(snapshot.data.error);
          }
          return _bangunWidgetBeritaPilihan(snapshot.data);
        } else if (snapshot.hasError) {
          return bangunWidgetError(snapshot.error);
        } else {
          return bangunWidgetLoading();
        }
      },
    );
  }

  // method widget berita pilihan
  Widget _bangunWidgetBeritaPilihan(ResponArtikel data) {
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
      return Container(
        height: articles.length / 2 * 210.0,
        padding: EdgeInsets.all(5.0),
        child: new GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: articles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.85),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
              child: GestureDetector(
                onTap: () {
                  // ke Detail Berita
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
                  width: 220.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          1.0,
                          1.0,
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0)),
                            image: DecorationImage(
                                // mengambil img artikel (https://newsapi.org/v2/)
                                image: articles[index].img == null
                                    ? AssetImage("aseets/image/placeholder.jpg")
                                    : NetworkImage(articles[index].img),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                        child: Text(
                          // judul artikel
                          articles[index].judul,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(height: 1.3, fontSize: 15.0),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            width: 180,
                            height: 1.0,
                            color: Colors.black12,
                          ),
                          Container(
                            width: 30,
                            height: 3.0,
                            color: Style.Warna.mainColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Sumber artikel
                            Text(
                              articles[index].sumber.nama,
                              style: TextStyle(
                                  color: Style.Warna.mainColor, fontSize: 9.0),
                            ),
                            // waktu terbit berita
                            Text(
                              timeUntil(
                                  DateTime.parse(articles[index].tanggal)),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 9.0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
