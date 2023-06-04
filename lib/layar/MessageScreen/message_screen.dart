import 'package:flutter/material.dart';
import 'package:j_news_app/layar/MessageScreen/Components/appbar.dart';
import 'package:j_news_app/layar/MessageScreen/Components/chat_widget.dart';
import 'package:j_news_app/layar/MessageScreen/Components/message_textfield.dart';
import 'package:j_news_app/model/chat.dart';
import 'package:j_news_app/utils/sized_config.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LayarChatAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 76,
              width: SizeConfig.widthMultiplier * 100,
              child: Padding(
                padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 5),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.5,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.widthMultiplier * 5),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Divider(
                            thickness: 1,
                          ),
                          Center(
                            child: Container(
                              height: SizeConfig.heightMultiplier * 3,
                              width: SizeConfig.widthMultiplier * 20,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  "Hari ini",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return ChatWidget(
                            msg: messages[index],
                            index: index,
                          );
                        }),
                    // SizedBox(
                    //   height: SizedConfig.heightMultiplier * 9,
                    // )
                  ],
                ),
              ),
            ),
            MessageSendTextField(),
          ],
        ),
      )),
    );
  }
}
