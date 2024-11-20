import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:zenulimss/game/assets.dart';
import 'package:zenulimss/game/configuration.dart';
import 'package:zenulimss/game/flappy_bird_game.dart';

class Ground extends ParallaxComponent<FlappyBirdGame> with HasGameRef<FlappyBirdGame>{
  Ground();

  @override
  Future<void> onLoad() async {
    final ground  = await Flame.images.load(Assets.ground);
    parallax =  Parallax([
      ParallaxLayer(
        ParallaxImage(ground, fill: LayerFill.none)
      )
    ]);

    add(
      RectangleHitbox(
        position: Vector2(0, gameRef.size.y - Configuration.groundHeight),
        size: Vector2(gameRef.size.x, Configuration.groundHeight)
      )
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Configuration.gameSpeed;
  }
}