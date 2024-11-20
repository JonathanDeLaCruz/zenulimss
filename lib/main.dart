import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:zenulimss/game/flappy_bird_game.dart';
import 'package:zenulimss/screens/game_over_screen.dart';
import 'package:zenulimss/screens/main_menu_screen.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}

