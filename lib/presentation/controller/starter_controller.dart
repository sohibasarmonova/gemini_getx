import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class StarterController extends GetxController {

  late VideoPlayerController videoPlayerController;
  FlutterTts flutterTts = FlutterTts();

initVideoPlayer(){
  videoPlayerController =
  VideoPlayerController.asset("assets/videos/gemini_video.mp4")
    ..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      update();
    });

    videoPlayerController.play();
    videoPlayerController.setLooping(true);

      }
      stopVideoPlayer(){
        videoPlayerController.dispose();

      }
  Future speakTTS(String text) async {
    var result = await flutterTts.speak(text);
    // if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future stopTTS() async {
    var result = await flutterTts.stop();
    // if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

}