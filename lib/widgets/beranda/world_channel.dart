import 'package:flutter/material.dart';
import 'package:j_news_app/bloc/get_sumber_bloc.dart';
import 'package:j_news_app/layar/detail_sumber.dart';
import 'package:j_news_app/model/respon_sumber.dart';
import 'package:j_news_app/model/sumber.dart';
import 'package:j_news_app/style/warna.dart' as Style;

class WorldChannel extends StatefulWidget {
  @override
  _WorldChannelState createState() => _WorldChannelState();
}

class _WorldChannelState extends State<WorldChannel> {
  @override
  void initState() {
    super.initState();
    getSumberBloc..getSumber();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ResponSumber>(
      stream: getSumberBloc.subject.stream,
      builder: (context, AsyncSnapshot<ResponSumber> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return Container();
          }
          return _bangunWidgetSumber(snapshot.data);
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }

  Widget _bangunWidgetSumber(ResponSumber data) {
    List<Sumber> sources = data.sumberS;
    if (sources.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Tidak ada channel..",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
        height: 115.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sources.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(top: 10.0, right: 0.0),
              width: 80.0,
              child: GestureDetector(
                onTap: () {
                  //------------------
                  // ke Detail Sumber
                  //------------------
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailSumber(
                        sumber: sources[index],
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: sources[index].id,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: Offset(
                                1.0,
                                1.0,
                              ),
                            )
                          ],
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              // mengambil image .png di folder asset
                              image: AssetImage(
                                  "assets/logo/${sources[index].id}.png")),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    // Nama-nama Channel
                    Text(
                      sources[index].nama,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    // kategori channel
                    Text(
                      sources[index].kategori,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.4,
                          color: Style.Warna.titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}
