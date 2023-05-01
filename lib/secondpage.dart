import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:locally/locally.dart';



class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  //




  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    FloatingActionButton(onPressed: () {
      CherryToast.info(
        title:  Text("User added"),
        action:  Text("Display information"),
        actionHandler: (){
          print("Action button pressed");
        },
      ).show(context);
    },) );
  }
}
