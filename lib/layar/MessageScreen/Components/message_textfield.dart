import 'package:flutter/material.dart';
import 'package:j_news_app/utils/sized_config.dart';

class MessageSendTextField extends StatelessWidget {
  const MessageSendTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.widthMultiplier * 3,
          right: SizeConfig.widthMultiplier * 3,
          bottom: SizeConfig.heightMultiplier * 2),
      height: SizeConfig.heightMultiplier * 6,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.only(
          left: SizeConfig.widthMultiplier * 4,
          right: SizeConfig.widthMultiplier * 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2,
            )
          ]),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Ketik pesan anda"),
            ),
          ),
          Icon(
            Icons.mic_none_outlined,
            color: Colors.grey.shade600,
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 5,
          ),
          Icon(
            Icons.send,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
