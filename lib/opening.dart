import 'package:flutter/material.dart';
import 'package:j_news_app/layar/layar_utama.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/Studio Live Broadcast.jpg"),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline3,
                children: const [
                  TextSpan(
                    text: "world",
                  ),
                  TextSpan(
                    text: "NEWS.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LayarUtama(),
                    ),
                  );
                },
                child: TombolMasuk(
                  text: "Masuk",
                  ukuranFont: 20,
                  verticalPadding: 16,
                  tekan: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TombolMasuk extends StatelessWidget {
  final String text;
  final Function tekan;
  final double verticalPadding;
  final double ukuranFont;

  const TombolMasuk({
    Key key,
    this.text,
    this.tekan,
    this.verticalPadding = 16,
    this.ukuranFont = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 15),
              blurRadius: 30,
              color: const Color(0xFF49DF62).withOpacity(.84)),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: ukuranFont,
          fontWeight: FontWeight.bold,
          color: Colors.green[200],
        ),
      ),
    );
  }
}
