import 'package:j_news_app/model/artikel.dart';

class ResponArtikel {
  final List<Artikel> artikels;
  final String error;

  ResponArtikel(this.artikels, this.error);

  ResponArtikel.fromJson(Map<String, dynamic> json)
      : artikels = (json["articles"] as List)
            .map((i) => new Artikel.fromJson(i))
            .toList(),
        error = "";

  ResponArtikel.withError(String errorValue)
      : artikels = List(),
        error = errorValue;
}
