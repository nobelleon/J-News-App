import 'package:dio/dio.dart';
import 'package:j_news_app/model/respon_artikel.dart';
import 'package:j_news_app/model/respon_sumber.dart';

class GudangBerita {
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = "48ada7bdbe624683bc725f19f1301665";

  final Dio _dio = Dio();

  var getSourcesUrl = '$mainUrl/sources';
  var getTopHeadlinesUrl = '$mainUrl/top-headlines';
  var everythingUrl = "$mainUrl/everything";

  // Url Sumber
  Future<ResponSumber> getSources() async {
    var params = {"apiKey": apiKey, "language": "en", "country": "us"};
    try {
      Response response =
          await _dio.get(getSourcesUrl, queryParameters: params);
      return ResponSumber.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponSumber.withError("$error");
    }
  }

  // Url Berita Utama (Top Headlines)
  Future<ResponArtikel> getTopHeadlines() async {
    var params = {"apiKey": apiKey, "country": "us"};
    try {
      Response response =
          await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ResponArtikel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponArtikel.withError("$error");
    }
  }

  // Url Pencarian
  Future<ResponArtikel> search(String value) async {
    var params = {"apiKey": apiKey, "q": value, "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: params);
      return ResponArtikel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponArtikel.withError("$error");
    }
  }

  // Url Berita Pilihan
  Future<ResponArtikel> getBeritaPilihan() async {
    var params = {"apiKey": apiKey, "q": "apple", "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: params);
      return ResponArtikel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponArtikel.withError("$error");
    }
  }

  // Url Sumber Berita
  Future<ResponArtikel> getSourceNews(String sourceId) async {
    var params = {"apiKey": apiKey, "sources": sourceId};
    try {
      Response response =
          await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ResponArtikel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponArtikel.withError("$error");
    }
  }
}
