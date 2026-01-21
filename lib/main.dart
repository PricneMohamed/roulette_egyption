import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "الروليت المصري",
            style: TextStyle(
              fontFamily: "Taj",
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red[700],
        ),
        body: Roulette(),
      ),
    ),
  );
}

class Roulette extends StatefulWidget {
  const Roulette({super.key});

  @override
  State<Roulette> createState() => _RouletteState();
}

class _RouletteState extends State<Roulette> {
  int rightImage = 1;
  int leftImage = 2;
  @override
  Widget build(BuildContext context) {
    void changeImageDep() {
      rightImage = Random().nextInt(9) + 1;
      leftImage = Random().nextInt(9) + 1;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Center(
                  child: leftImage == rightImage
                      ? Image.asset("images/tamer.png", width: 300, height: 300)
                      : Text(
                          "حاول مرة اخري",
                          style: TextStyle(
                            fontFamily: "Taj",
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeImageDep();
                    });
                  },
                  child: Image.asset("images/image-$leftImage.png"),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeImageDep();
                    });
                  },
                  child: Image.asset("images/image-$rightImage.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
