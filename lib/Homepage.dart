import 'package:flutter/material.dart';
import 'dart:math';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List dice = [
    const AssetImage('asset/one.png'),
    const AssetImage('asset/two.png'),
    const AssetImage('asset/three.png'),
    const AssetImage('asset/four.png'),
    const AssetImage('asset/five.png'),
    const AssetImage('asset/six.png')
  ];
  var diceFace;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      diceFace = dice[0];
    });
  }

  void faceGenerator() {
    var rndm = Random().nextInt((dice.length) - 1);
    setState(() {
      diceFace = dice[rndm];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Roller'),
        backgroundColor: Colors.amber[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
                image: diceFace,
                width: 200,
                height: 200,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: faceGenerator,
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.black),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  overlayColor: MaterialStatePropertyAll(Colors.grey[400]),
                ),
                child: const Text('Let\'s Roll'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
