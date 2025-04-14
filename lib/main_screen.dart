import 'dart:math';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> choices = ["👊", "✌️", "✋"];
  List<String> pics = [
    "assets/images/pic1.png",
    "assets/images/pic3.png",
    "assets/images/pic2.png",
  ];
  String userChoice = "❓";
  String compChoice = "❓";
  String? result;
  int userScore = 0;
  int compScore = 0;
  void generateResult() {
    int userIndex = choices.indexWhere((element) => element == userChoice);
    int compIndex = choices.indexWhere((element) => element == compChoice);
    if (userIndex == compIndex) {
      result = "It is a tie";
    } else if (userIndex == 0 && compIndex == 1) {
      result = "You win";
      userScore++;
    } else if (userIndex == 1 && compIndex == 2) {
      result = "You win";
      userScore++;
    } else if (userIndex == 2 && compIndex == 0) {
      result = "You win";
      userScore++;
    } else {
      result = "You lose";
      compScore++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Lest's Play Rock-Paper-Scissors",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 30),
            Text("You: $userChoice", style: TextStyle(fontSize: 17)),
            Text("Computer: $compChoice", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  pics.map((e) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          userChoice = choices[pics.indexOf(e)];
                          compChoice = choices[Random().nextInt(3)];
                          generateResult();
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue,
                        ),
                        child: Image.asset(e),
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 17),
            result == null
                ? Container()
                : Text(result!, style: TextStyle(fontSize: 17)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Score: $userScore", style: TextStyle(fontSize: 20)),
                Text(
                  "Computer Score: $compScore",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  userChoice = "❓";
                  compChoice = "❓";
                  userScore = 0;
                  result = null;
                  compScore = 0;
                });
              },
              icon: Icon(Icons.restart_alt, size: 60),
            ),
          ],
        ),
      ),
    );
  }
}
