import 'package:flutter/material.dart';
import 'package:onepicword/secondpage.dart';

import 'c5.dart';

void main() {
  runApp(MaterialApp(home: c5()));
}

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      ),
      body: Container(
        margin: EdgeInsets.all(100),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: InkWell(onTap: () {

                    },
                      child: Container(margin: EdgeInsets.only(top: 150),
                        height: 50,
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text("Tap to Play",style: TextStyle(fontSize: 25),)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 250,
                      color: Colors.blue,
                      child: Center(child: Text("Tap to Play",style: TextStyle(fontSize: 25),)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
