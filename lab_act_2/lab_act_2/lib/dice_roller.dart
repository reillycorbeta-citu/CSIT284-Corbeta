import 'dart:math';
import 'package:flutter/material.dart';
 
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
 
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}
 
class _DiceRollerState extends State<DiceRoller> {
  String currentDiceImage = 'assets/dice-images/dice-1.png';
 
  void rollDice() {
    setState(() {
      currentDiceImage = 'assets/dice-images/dice-${Random().nextInt(6) + 1}.png';
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          currentDiceImage,
          width: 200,
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: rollDice,
          child: const Text(
            'Roll Dice',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ],
    );
  }
}