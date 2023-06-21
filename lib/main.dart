// FLAPPY BIRD
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappybird/flappyface/game/flappy_bird.dart';
import 'package:flappybird/vision_detector_views/face_detector_view_flappy.dart';
import 'package:flutter/material.dart';

import 'flappyface/components/gameovermenu_component.dart';
import 'flappyface/components/startmenu_component.dart';

import 'package:camera/camera.dart';

final Changer changer = Changer();
List<CameraDescription> cameras = [];
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

    cameras = await availableCameras();


  runApp(const FlappyFaceDetect());
}

class FlappyFaceDetect extends StatelessWidget {
  const FlappyFaceDetect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          SizedBox(
            width: 384,
            height: 500,
            child: GameWidget(
              game: FlappyBird(),
              overlayBuilderMap: {
                'StartMenu': (BuildContext context, FlappyBird flappyBird) {
                  return StartMenu(
                    gameRef: flappyBird,
                  );
                },
                'GameOverMenu': (BuildContext context, FlappyBird flappyBird) {
                  return GameOverMenu(
                    gameRef: flappyBird,
                  );
                }
              },
            ),
          ),
          SizedBox(
            width: 384,
            height: 300,
            child: FaceDetectorView(),
          ),
        ],
      )),
    );
  }
}

class Changer extends ChangeNotifier {
  int currentBar = 0; // for choosing gap
  late int flappyNosePoint;
  bool firstFrame = true;

  int skipFrameFlappy = 0; // To skip frames after detected
  bool isFlappySkipped = false;

  bool isFlappyHeadUp = false; // used in flappy

  void notify() {
    notifyListeners();
  }
}
