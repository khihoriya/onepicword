import 'dart:convert';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:onepicword/confiit.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> with WidgetsBindingObserver{
  AudioPlayer player = AudioPlayer();
  AudioPlayer player1 = AudioPlayer();
  List someimage = [];
  late ConfettiController _topController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getimagelist();
    _topController = ConfettiController(duration: const Duration(seconds: 3));
    initplayer();
    initplay();
  }
  initplayer(){
    player.setAsset("music/stranger-things-124008.mp3");
    player.setLoopMode(LoopMode.one);
  }

  initplayer1(){
    player.setAsset("music/mixkit-fairy-cartoon-success-voice-344.wav");
    player.setLoopMode(LoopMode.one);
  }
  initplay()
  async {
    await player.play();

  }
  initplay1()
  async {
    await player1.play();

  }

  initpause()
  async {
    await player.pause();
  }

  initstop()
  async {
    await player.stop();
  }


  @override
  void dispose() {
    // dispose the controller
    _topController.dispose();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      initplay();

      print("===$state");
    } else if (state == AppLifecycleState.paused) {

      initpause();

    }
  }


  Future<void> getimagelist() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .where((String key) => key.contains('.webp'))
        .toList();

    setState(() {
      someImages = imagePaths; //someimage is a list

      int r = Random().nextInt(someImages.length);
      //
      randomimg = someImages[r];
      String s = randomimg.split("/")[1];
      String ss = s.split(".")[0];
      AnswerList = ss.split("");

      // AnswerList = someImages[Random().nextInt(someImages.length)]
      //     .toString()
      //     .split("/")[1]
      //     .split("\.")[0]
      //     .split("");

      String abcd = "abcdefghijklmnopqrstuvwxyz";
      List abc = abcd.split("");
      abc.shuffle();
      bottomList = abc.getRange(0, 10 - AnswerList.length).toList();
      bottomList.addAll(AnswerList);
      bottomList.shuffle();
      topList = List.filled(AnswerList.length, "");

      print("=======$AnswerList=\n===${bottomList}");
      print("==$randomimg");
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/w15.jpg"),fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar( actions: [IconButton(onPressed: () {
              initplay();
        }, icon: Icon(Icons.play_arrow)),IconButton(onPressed: () {
            initpause();
        }, icon: Icon(Icons.pause))],
          title: Text("Game"),
        ),
        body: Column(children: [
          // Stack(
          //   children: <Widget>[
          //
          //   ],
          // ),
          Expanded(
            flex: 4,
            child: Stack(children: [
              Container(
                child: Card(
                  color: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 5)
                          ],
                          image:
                              DecorationImage(image: AssetImage("$randomimg")),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
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
                  shouldLoop: true,

                  // assign colors of any choice
                  colors: const [
                    Colors.green,
                    Colors.yellow,
                    Colors.pink,
                    Colors.orange,
                    Colors.blue
                  ],
                ),
              )
            ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: AnswerList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              bottomList[mm["$index"]] = topList[index];
                              topList[index] = "";
                            });
                          },
                          child: Card(
                            color: Colors.deepPurple,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                  child: Text(
                                topList[index].toString().toUpperCase(),
                                style: TextStyle(fontSize: 25),
                              )),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return index==10?Card(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(color: Colors.red, blurRadius: 20)
                                ]),
                            child: Center(
                                child: Icon(Icons.ac_unit),)
                          ),
                        ):index==11?Card(
                          child: Container(
                              margin: EdgeInsets.all(10),
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(color: Colors.red, blurRadius: 20)
                                  ]),
                              child: Center(
                                child: Icon(Icons.ac_unit),)
                          ),
                        ):InkWell(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i <= AnswerList.length; i++) {
                                if (topList[i] == "") {
                                  {
                                    setState(() {
                                      topList[i] = bottomList[index];
                                      mm["$i"] = index;
                                      bottomList[index] = "";

                                      if (AnswerList.toString() ==
                                          topList.toString()) {
                                        print("fhfhfgh");
                                        setState(() {
                                          initplay1();
                                          _topController.play();
                                          Future.delayed(Duration(seconds: 4))
                                              .then((value) {
                                            getimagelist();
                                          });

                                          // Navigator.pushReplacement(context,
                                          //     MaterialPageRoute(
                                          //   builder: (context) {
                                          //     return Container(
                                          //         child: ConfettiWidget(
                                          //       confettiController: _topController,
                                          //       blastDirection: pi / 2,
                                          //       maxBlastForce: 5,
                                          //       minBlastForce: 1,
                                          //       emissionFrequency: 0.01,
                                          //
                                          //       // 10 paticles will pop-up at a time
                                          //       numberOfParticles: 20,
                                          //
                                          //       // particles will come down
                                          //       gravity: 1,
                                          //
                                          //       // start again as soon as the
                                          //       // animation is finished
                                          //       shouldLoop: true,
                                          //
                                          //       // assign colors of any choice
                                          //       colors: const [
                                          //         Colors.green,
                                          //         Colors.yellow,
                                          //         Colors.pink,
                                          //         Colors.orange,
                                          //         Colors.blue
                                          //       ],
                                          //     ));
                                          //
                                          //   },
                                          //
                                          // ));

                                          // showDialog(
                                          //     builder: (context) {
                                          //         return AlertDialog(
                                          //         content: Text("winn"),
                                          //       );
                                          //     },
                                          //     context: context);
                                        });
                                      }
                                    });
                                    break;
                                  }
                                }
                              }
                            });
                          },
                          child: Card(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(color: Colors.red, blurRadius: 20)
                                  ]),
                              child: Center(
                                  child: Text(
                                "${bottomList[index]}".toUpperCase(),
                                style: TextStyle(fontSize: 25),
                              )),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  String randomimg = "";
  List someImages = [];
  List topList = [];
  List bottomList = [];
  List AnswerList = [];
  Map mm = {};
}
