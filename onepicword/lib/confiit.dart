import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

// declare confettiController;
  late ConfettiController _topController;

  @override
  void initState() {
    super.initState();

    // initialize confettiController
    _topController = ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {

    // dispose the controller
    _topController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("GeeksForGeeks"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: <Widget>[

              // align the confetti on the screen
              Align(
                alignment:

                // confetti will pop from top-center
                Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _topController,
                  blastDirection: pi / 2,
                  maxBlastForce: 5,
                  minBlastForce: 1,
                  emissionFrequency: 0.01,

                  // 10 paticles will pop-up at a time
                  numberOfParticles: 20,

                  // particles will come down
                  gravity: 1,

                  // start again as soon as the
                  // animation is finished
                  shouldLoop:
                  true,

                  // assign colors of any choice
                  colors: const [
                    Colors.green,
                    Colors.yellow,
                    Colors.pink,
                    Colors.orange,
                    Colors.blue
                  ],
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () {

                      // invoking confettiController
                      // to come into play
                      _topController.play();
                    },
                    child: Text('Top',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
