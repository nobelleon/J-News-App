import 'package:j_news_app/model/sumber.dart';

class ResponSumber {
  final List<Sumber> sumberS;
  final String error;

  ResponSumber(this.sumberS, this.error);

  ResponSumber.fromJson(Map<String, dynamic> json)
      : sumberS = (json["sources"] as List)
            .map((i) => new Sumber.fromJson(i))
            .toList(),
        error = "";

  ResponSumber.withError(String errorValue)
      : sumberS = List(),
        error = errorValue;
}
