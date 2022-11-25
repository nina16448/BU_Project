// ignore_for_file: file_names
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'class/Choose_Button.dart';
import 'class/Decision_Button.dart';
import 'class/drawer.dart';
import 'class/list.dart';
import 'class/top_bar.dart';
import 'class/Globals.dart';

class Login_Choice extends StatelessWidget {
  const Login_Choice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var choice_text = Text(
        "驗證方式",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        )
    );

    var Passwordbutton = ElevatedButton(
      child: Text('密碼登錄'),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/PasswordLogin');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 56, 144, 189),
        textStyle: TextStyle(fontSize: 30.0),
      ),
    );

    var FaceIDbutton = ElevatedButton(
      child: Text('生物辨識'),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/FaceIDLogin');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 56, 144, 189),
        textStyle: TextStyle(fontSize: 30.0),
      ),
    );

    return Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            // color: Colors.amber,
            constraints: BoxConstraints(
                maxWidth: 300, maxHeight: 200, minWidth: 50, minHeight: 50),
            child: Column(
                children: [
                  choice_text,
                  Passwordbutton,
                  FaceIDbutton,
                ]
            ),
          ),
        )
    );
  }
}