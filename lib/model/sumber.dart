class Sumber {
  final String id;
  final String nama;
  final String deskripsi;
  final String url;
  final String kategori;
  final String negara;
  final String bahasa;

  Sumber(
    this.id,
    this.nama,
    this.deskripsi,
    this.url,
    this.kategori,
    this.negara,
    this.bahasa,
  );

  Sumber.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        nama = json["name"],
        deskripsi = json["description"],
        url = json["url"],
        kategori = json["category"],
        negara = json["country"],
        bahasa = json["language"];
}
