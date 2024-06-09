import 'package:flutter/material.dart';
import 'package:gemini_getx/presentation/controller/starter_controller.dart';
import 'package:gemini_getx/presentation/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  final starterController = Get.find<StarterController>();




  @override
  void initState() {
    super.initState();
starterController.initVideoPlayer();

  }

  @override
  void dispose() {
    starterController.stopVideoPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StarterController>(builder: (_){
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Container(
                  child: Image(
                    width: 150,
                    image: AssetImage('assets/images/gemini_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: starterController.videoPlayerController.value.isInitialized
                      ? VideoPlayer(starterController.videoPlayerController)
                      : Container(),
                ),
                Container(
                  height: 50,
                  //color: Colors.black,
                  decoration: BoxDecoration(
                    // color: Colors.black,
                      border:Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  // height: 50,
                  child: MaterialButton(
                    // color: Colors.black,


                    // color: Colors.white,
                    onPressed: (){
                     // Navigator.pushReplacementNamed(context, HomePage.id);
                       Get.offNamed(HomePage.id);
                    },
                    child: Text('Chat with Gemini', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}