import 'package:j_news_app/gudang_berita/gudang_berita.dart';
import 'package:j_news_app/model/respon_artikel.dart';
import 'package:rxdart/rxdart.dart';

class GetBeritaPilihanBloc {
  final GudangBerita _gudangBerita = GudangBerita();

  final BehaviorSubject<ResponArtikel> _subject =
      BehaviorSubject<ResponArtikel>();

  // respon artikel (Berita Pilihan)
  getBeritaPilihan() async {
    ResponArtikel response = await _gudangBerita.getBeritaPilihan();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ResponArtikel> get subject => _subject;
}

final getBeritaPilihanBloc = GetBeritaPilihanBloc();
