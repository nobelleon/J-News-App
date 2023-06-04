import 'package:j_news_app/gudang_berita/gudang_berita.dart';
import 'package:j_news_app/model/respon_sumber.dart';
import 'package:rxdart/rxdart.dart';

class GetSumberBloc {
  final GudangBerita _gudangBerita = GudangBerita();
  final BehaviorSubject<ResponSumber> _subject =
      BehaviorSubject<ResponSumber>();

  // respon sumber
  getSumber() async {
    ResponSumber response = await _gudangBerita.getSources();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ResponSumber> get subject => _subject;
}

final getSumberBloc = GetSumberBloc();
