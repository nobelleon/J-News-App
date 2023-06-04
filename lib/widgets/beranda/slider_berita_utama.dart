import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:j_news_app/bloc/get_berita_utama_teratas_bloc.dart';
import 'package:j_news_app/elements/error.dart';
import 'package:j_news_app/elements/loader.dart';
import 'package:j_news_app/layar/detail_berita.dart';
import 'package:j_news_app/model/artikel.dart';
import 'package:j_news_app/model/respon_artikel.dart';
import 'package:timeago/timeago.dart' as timeago;

class SliderBeritaUtama extends StatefulWidget {
  @override
  _SliderBeritaUtamaState createState() => _SliderBeritaUtamaState();
}

class _SliderBeritaUtamaState extends State<SliderBeritaUtama> {
  @override
  void initState() {
    super.initState();
    getBeritaUtamaTrtsBloc..getBeritaUtama();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ResponArtikel>(
      stream: getBeritaUtamaTrtsBloc.subject.stream,
      builder: (context, AsyncSnapshot<ResponArtikel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return bangunWidgetError(snapshot.data.error);
          }
          return _bangunWidgetSliderBeritaUtama(snapshot.data);
        } else if (snapshot.hasError) {
          return bangunWidgetError(snapshot.error);
        } else {
          return bangunWidgetLoading();
        }
      },
    );
  }

  // method widget slider berita utama
  Widget _bangunWidgetSliderBeritaUtama(ResponArtikel data) {
    List<Artikel> articles = data.artikels;
    return Container(
        // plugin Slider image
        child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: false,
              height: 200.0,
              viewportFraction: 0.9,
            ),
            items: getTampilanSlider(articles)));
  }

  getTampilanSlider(List<Artikel> articles) {
    return articles
        .map(
          (article) => GestureDetector(
            onTap: () {
              // ke Detail Berita
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailBerita(
                    artikel: article,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          // mengambil img artikel (https://newsapi.org/v2/)
                          image: article.img == null
                              ? AssetImage("assets/image/placeholder.jpg")
                              : NetworkImage(article.img)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [
                            0.1,
                            0.9
                          ],
                          colors: [
                            Colors.purple.withOpacity(0.9),
                            Colors.white.withOpacity(0.0)
                          ]),
                    ),
                  ),
                  Positioned(
                    bottom: 30.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      width: 250.0,
                      child: Column(
                        children: <Widget>[
                          // judul artikel
                          Text(
                            article.judul,
                            style: TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 10.0,
                    child: Text(
                      // sumber artikel
                      article.sumber.nama,
                      style: TextStyle(color: Colors.white54, fontSize: 9.0),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: Text(
                      // waktu terbit artikel
                      timeUntil(DateTime.parse(article.tanggal)),
                      style: TextStyle(color: Colors.white54, fontSize: 9.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
