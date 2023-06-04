import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:j_news_app/utils/sized_config.dart';

class ProfilePicWidget extends StatefulWidget {
  const ProfilePicWidget({Key key}) : super(key: key);

  @override
  _ProfilePicWidgetState createState() => _ProfilePicWidgetState();
}

class _ProfilePicWidgetState extends State<ProfilePicWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AvatarGlow(
          glowColor: Colors.green,
          endRadius: 120,
          duration: const Duration(milliseconds: 2000),
          repeat: true,
          showTwoGlows: true,
          curve: Curves.easeOutQuad,
          child: Container(
            height: SizeConfig.heightMultiplier * 15,
            width: SizeConfig.widthMultiplier * 35,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/image/Charlotte Hawkins.png"),
                fit: BoxFit.cover,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
        ),
      ),
    );
  }
}
