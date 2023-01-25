import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'PongGame.dart';

class PongGameScreen extends StatelessWidget {
  const PongGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: PongGame());
  }
}
