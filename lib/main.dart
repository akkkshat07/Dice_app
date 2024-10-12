import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(RollingDiceApp());
}

class RollingDiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rolling Dice',
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatelessWidget {
  final Random _random = Random();

  void _rollDice(BuildContext context) {
    int diceValue = _random.nextInt(6) + 1;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You rolled a $diceValue!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _rollDice(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rolling Dice'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple[300]!, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              'Tap anywhere to roll the dice!',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
