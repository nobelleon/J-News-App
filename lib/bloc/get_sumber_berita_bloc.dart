import 'package:flutter/cupertino.dart';
import 'package:j_news_app/gudang_berita/gudang_berita.dart';
import 'package:j_news_app/model/respon_artikel.dart';
import 'package:rxdart/rxdart.dart';

class GetSumberBeritaBloc {
  final GudangBerita _gudangBerita = GudangBerita();
  final BehaviorSubject<ResponArtikel> _subject =
      BehaviorSubject<ResponArtikel>();

  // respon artikel (Sumber Berita)
  getSumberBerita(String sourceId) async {
    ResponArtikel response = await _gudangBerita.getSourceNews(sourceId);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ResponArtikel> get subject => _subject;
}

final getSumberBeritaBloc = GetSumberBeritaBloc();
