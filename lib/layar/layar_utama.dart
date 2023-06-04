import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:j_news_app/bloc/bottom_navbar_bloc.dart';
import 'package:j_news_app/layar/CallScreen/call_screen.dart';
import 'package:j_news_app/layar/VideoCallScreen/videocall_screen.dart';
import 'package:j_news_app/layar/tabs/layar_beranda.dart';
import 'package:j_news_app/layar/tabs/layar_pencarian.dart';
import 'package:j_news_app/layar/tabs/layar_sumber.dart';
import 'package:j_news_app/style/warna.dart' as Style;

class LayarUtama extends StatefulWidget {
  @override
  _LayarUtamaState createState() => _LayarUtamaState();
}

class _LayarUtamaState extends State<LayarUtama> {
  BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Style.Warna.mainColor,
          leading: Icon(
            EvaIcons.menu2Outline,
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            "JNews App 📰",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            //--------------------
            // Tombol Video Call
            //--------------------
            IconButton(
              icon: Icon(EvaIcons.video, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoCallScreen(),
                  ),
                );
              },
            ),
            //---------------------
            // Tombol Telp
            //---------------------
            IconButton(
              icon: Icon(EvaIcons.phoneCall, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      //-----------------------
      // Bottom Navigation Bar
      //-----------------------
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem, // default Beranda

          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            // Test Screen
            switch (snapshot.data) {
              case NavBarItem.HOME:
                return LayarBeranda(); // testScreen();
              case NavBarItem.SOURCES:
                return LayarSumber(); // testScreen();
              case NavBarItem.SEARCH:
                return LayarPencarian(); // testScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[100], spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                iconSize: 20,
                unselectedItemColor: Style.Warna.unguMuda,
                unselectedFontSize: 9.5,
                selectedFontSize: 9.5,
                type: BottomNavigationBarType.fixed,
                fixedColor: Style.Warna.mainColor,
                currentIndex: snapshot.data.index,
                onTap: _bottomNavBarBloc.pickItem,
                items: [
                  //---------
                  // Beranda
                  //---------
                  BottomNavigationBarItem(
                    label: "Beranda",
                    // title: Padding(
                    //   padding: EdgeInsets.only(top: 5.0),
                    //   child: Text(
                    //     "Beranda",
                    //     style: TextStyle(fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    icon: Icon(EvaIcons.homeOutline),
                    activeIcon: Icon(EvaIcons.home),
                  ),
                  //----------------
                  // Sumber Berita
                  //----------------
                  BottomNavigationBarItem(
                    label: "Sumber Berita",
                    // title: Padding(
                    //   padding: EdgeInsets.only(top: 5.0),
                    //   child: Text(
                    //     "Sumber Berita",
                    //     style: TextStyle(fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    icon: Icon(EvaIcons.gridOutline),
                    activeIcon: Icon(EvaIcons.grid),
                  ),
                  //------------
                  // Pencarian
                  //------------
                  BottomNavigationBarItem(
                    label: "Pencarian",
                    // title: Padding(
                    //   padding: EdgeInsets.only(top: 5.0),
                    //   child: Text(
                    //     "Pencarian",
                    //     style: TextStyle(fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    icon: Icon(EvaIcons.searchOutline),
                    activeIcon: Icon(EvaIcons.search),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //----------------------------------------------------------
  // Widget Untuk mengetes tampilan Bottom bar muncul atau tdk
  // ---------------------------------------------------------

  Widget testScreen() {
    return Container(
      color: Colors.green[200],
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Test Screen"),
        ],
      ),
    );
  }
}
