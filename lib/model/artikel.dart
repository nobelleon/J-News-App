import 'package:j_news_app/model/sumber.dart';

class Artikel {
  final Sumber sumber;
  final String pengarang;
  final String judul;
  final String deskripsi;
  final String url;
  final String img;
  final String tanggal;
  final String content;

  Artikel(this.sumber, this.pengarang, this.judul, this.deskripsi, this.url,
      this.img, this.tanggal, this.content);

  Artikel.fromJson(Map<String, dynamic> json)
      : sumber = Sumber.fromJson(json["source"]),
        pengarang = json["author"],
        judul = json["title"],
        deskripsi = json["description"],
        url = json["url"],
        img = json["urlToImage"],
        tanggal = json["publishedAt"],
        content = json["content"];
}
