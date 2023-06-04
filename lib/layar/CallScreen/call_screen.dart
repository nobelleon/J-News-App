import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:j_news_app/layar/CallScreen/Components/profile_pic_widget.dart';
import 'package:j_news_app/layar/MessageScreen/message_screen.dart';
import 'package:j_news_app/utils/sized_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            Text(
              "Hallo, \n Anda sedang berbicara dengan News reader Charlotte",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2.5,
                color: Colors.green[400],
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 10,
            ),
            // getar dering
            Container(
              height: SizeConfig.heightMultiplier * 30,
              width: SizeConfig.widthMultiplier * 100,
              child: const ProfilePicWidget(),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Text(
              "News reader Charlotte Hawkins",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2.5,
                  color: Colors.green[400],
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            const Text(
              "Berdering...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol tutup telpon
                GestureDetector(
                  onTap: () {
                    Get.back();
                    // Navigator.pop(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return;
                    //     },
                    //   ),
                    // );
                  },
                  child: Container(
                    height: SizeConfig.heightMultiplier * 8,
                    width: SizeConfig.widthMultiplier * 18,
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          offset: Offset(4, 8),
                          color: Colors.black26,
                          blurRadius: 8)
                    ], shape: BoxShape.circle, color: Colors.green[400]),
                    child: const Icon(
                      Icons.call_end,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MessageScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: SizeConfig.heightMultiplier * 8,
                    width: SizeConfig.widthMultiplier * 18,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(4, 8),
                          color: Colors.black26,
                          blurRadius: 8)
                    ], shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      MdiIcons.messageBulleted,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 0 * .15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
