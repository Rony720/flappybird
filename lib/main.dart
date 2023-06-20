// FLAPPY BIRD
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappybird/flappyface/game/flappy_bird.dart';
import 'package:flutter/material.dart';

import 'flappyface/components/gameovermenu_component.dart';
import 'flappyface/components/startmenu_component.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  runApp(GameWidget(
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
  ));
}
