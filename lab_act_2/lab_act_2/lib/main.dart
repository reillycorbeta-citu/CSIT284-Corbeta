import 'package:flutter/material.dart';
import 'package:lab_act_2/dice_roller.dart';
 
var currentDiceImage = 'assets/dice-images/dice-2.png';
void rollDice() {
  currentDiceImage = 'assets/dice-images/dice-4.png';
}
 
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.pinkAccent]),
          ),
          child: Center(child: DiceRoller()),
        ),
      ),
    ),
  );
}
 