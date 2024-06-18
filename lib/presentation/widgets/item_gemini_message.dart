



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:gemini_getx/date/models/message_model.dart';
import 'package:gemini_getx/presentation/controller/home_controller.dart';
import 'package:gemini_getx/presentation/pages/web_view_page.dart';
import 'package:lottie/lottie.dart';


Widget itemOfGeminiMessage(
    MessageModel message, HomeController homeController,BuildContext context) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(top: 15, bottom: 15),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 24,
                height: 24,
                child: Lottie.asset('assets/animation/gemini_icon.json'),              ),
              GestureDetector(
                onTap: () {
                  homeController.speakTTS(message.message!);
                },
                child: Icon(
                  Icons.volume_up,
                  color: Colors.white70,
                ),
              )
            ],
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              child: Linkify(
                onOpen: (link) {
                 Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context){
                   return WebViewPage(url: link.url);
                 }));
                },
                text: message.message!,
                style: TextStyle(
                    color: Color.fromRGBO(173, 173, 176, 1), fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}




