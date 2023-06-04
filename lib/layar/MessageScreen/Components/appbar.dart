import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:j_news_app/layar/CallScreen/call_screen.dart';
import 'package:j_news_app/layar/layar_utama.dart';
import 'package:j_news_app/utils/sized_config.dart';

class LayarChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(
        SizeConfig.heightMultiplier * 12,
      );

  const LayarChatAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.green,
      toolbarHeight: SizeConfig.heightMultiplier * 12,
      title: Row(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 8,
            width: SizeConfig.widthMultiplier * 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage("assets/image/Charlotte Hawkins.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Charlotte Hawkins",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 0.8,
              ),
              Text(
                "News reader studio",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 0.8,
              ),
              Text(
                "Live Broadcast",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 17,
          ),
          // masuk ke layar Call
          GestureDetector(
            onTap: () {
              Get.to(LayarUtama());
            },
            child: Container(
              height: SizeConfig.heightMultiplier * 6,
              width: SizeConfig.widthMultiplier * 15,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    offset: Offset(4, 8), color: Colors.black26, blurRadius: 8)
              ], shape: BoxShape.circle, color: Colors.green[200]),
              child: Icon(
                EvaIcons.tv,
                color: Colors.green[400],
              ),
            ),
          )
        ],
      ),
    );
  }
}
