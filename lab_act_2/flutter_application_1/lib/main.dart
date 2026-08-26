import 'package:flutter/material.dart';
 
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black,
              Colors.white,
            ])
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Image.asset(
                width: 200,
                'asset/dice-images/dice-2.png'
              ),
              TextButton(onPressed: () {}, child: Text("Roll Dice")
              child: Text
              )
            ],),
          ),
        ),
      ),
    ),
  );
}