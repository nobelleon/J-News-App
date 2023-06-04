import 'package:flutter/material.dart';
import 'package:j_news_app/widgets/beranda/berita_pilihan.dart';
import 'package:j_news_app/widgets/beranda/slider_berita_utama.dart';
import 'package:j_news_app/widgets/beranda/world_channel.dart';

class LayarBeranda extends StatefulWidget {
  @override
  _LayarBerandaState createState() => _LayarBerandaState();
}

class _LayarBerandaState extends State<LayarBeranda> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //-----------------------
        // Slider Berita Utama
        //-----------------------
        SliderBeritaUtama(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text(
                "Channel Dunia 🌏",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
            ],
          ),
        ),
        //---------------
        // World Channel
        //---------------
        WorldChannel(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text(
                "Berita pilihan 😉",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ],
          ),
        ),
        //----------------
        // berita pilihan
        //----------------
        BeritaPilihan()
      ],
    );
  }
}
