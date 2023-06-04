class Chat {
  String pesan, waktu, image;
  bool pengirim;

  Chat({
    this.pesan,
    this.waktu,
    this.pengirim,
    this.image,
  });
}

List<Chat> messages = [
  Chat(
    pesan:
        "Hallo Mr.Donni, bagaimana fashion di sana apa ada fashion terbaru ?",
    waktu: "16:45 PM",
    pengirim: false, // mengaktifkan image
    image: "assets/image/Charlotte Hawkins.png",
  ),
  Chat(
    pesan:
        "Hallo Miss Charlotte, hari ini fashion terbaru motif Batik Nusantara Miss Charlotte.",
    waktu: "16:47 PM",
    pengirim: false,
    image: "assets/image/Donni Bochmann.jpg",
  ),
  Chat(
    pesan: "Motif-motif apa saja yang sedang trend disana Mr.Donni ?",
    waktu: "16:49 PM",
    pengirim: true,
    image: "assets/image/Charlotte Hawkins.png",
  ),
  Chat(
    pesan:
        "Disini yang sedang trend batik sumatera, jawa, kalimantan, Sulawesi, & Papua Miss Charlotte.",
    waktu: "16:52 PM",
    pengirim: false,
    image: "assets/image/Donni Bochmann.jpg",
  ),
  Chat(
    pesan:
        "Waahh keren yaa.. pantas saja masuk peringkat market dunia fashion batik ini.",
    waktu: "16:55 PM",
    pengirim: true,
    image: "assets/image/Charlotte Hawkins.png",
  ),
  Chat(
    pesan:
        "Ya tentu Miss Charlotte kita ngga kalah saing dengan market dunia soal fashion.",
    waktu: "17:00 PM",
    pengirim: false,
    image: "assets/image/Donni Bochmann.jpg",
  ),
];
