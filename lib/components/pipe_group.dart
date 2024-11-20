import 'dart:math';

import 'package:flame/components.dart';
import 'package:zenulimss/components/pipe.dart';
import 'package:zenulimss/game/configuration.dart';
import 'package:zenulimss/game/flappy_bird_game.dart';
import 'package:zenulimss/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Configuration.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);

    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(pipePosition: PipePosition.bottom, height: heightMinusGround - (centerY + spacing / 2))
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Configuration.gameSpeed * dt;

    if(position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if(gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
  }
}