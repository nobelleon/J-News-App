import 'package:flutter/material.dart';
import 'package:j_news_app/bloc/get_sumber_bloc.dart';
import 'package:j_news_app/elements/loader.dart';
import 'package:j_news_app/layar/detail_sumber.dart';
import 'package:j_news_app/model/respon_sumber.dart';
import 'package:j_news_app/model/sumber.dart';

class LayarSumber extends StatefulWidget {
  @override
  _LayarSumberState createState() => _LayarSumberState();
}

class _LayarSumberState extends State<LayarSumber> {
  @override
  void initState() {
    super.initState();
    getSumberBloc..getSumber();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ResponSumber>(
      stream: getSumberBloc.subject.stream,
      builder: (context, AsyncSnapshot<ResponSumber> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return Container();
          }
          return _bangunWidgetSumber(snapshot.data);
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return bangunWidgetLoading();
        }
      },
    );
  }

  Widget _bangunWidgetSumber(ResponSumber data) {
    List<Sumber> sources = data.sumberS;
    if (sources.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Tidak ada channel..",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return GridView.builder(
        itemCount: sources.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.86,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
            child: GestureDetector(
              onTap: () {
                //------------------
                // ke Detail Sumber
                //------------------
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailSumber(
                      sumber: sources[index],
                    ),
                  ),
                );
              },
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[100],
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        1.0,
                        1.0,
                      ),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: sources[index].id,
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/logo/${sources[index].id}.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                      child: Text(
                        sources[index].nama,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
