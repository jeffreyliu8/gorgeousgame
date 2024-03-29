import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'ball.dart';

class AIPaddle extends PositionComponent
    with HasGameRef<FlameGame>, CollisionCallbacks, KeyboardHandler {
  late final RectangleHitbox paddleHitBox;
  late final RectangleComponent paddle;

  @override
  FutureOr<void> onLoad() {
    final worldRect = gameRef.size.toRect();

    size = Vector2(10, 100);
    position.x = worldRect.width * 0.1;
    position.y = worldRect.height / 2 - size.y / 2;
    paddle = RectangleComponent(
      size: size,
      paint: Paint()..color = Colors.red,
    );
    paddleHitBox = RectangleHitbox(
      size: size,
    );

    addAll([
      paddle,
      paddleHitBox,
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    final ball = gameRef.children.singleWhere((child) => child is Ball) as Ball;
    final ballPositionWrtPaddleHeight = ball.y + (size.y);
    final isOutOfBounds =
        ballPositionWrtPaddleHeight > gameRef.size.y || ball.y < 0;

    if (!isOutOfBounds) {
      if (ball.y > position.y) {
        position.y += (400 * dt);
      }

      if (ball.y < position.y) {
        position.y -= (400 * dt);
      }
    }
  }
}
