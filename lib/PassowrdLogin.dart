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

class PasswordLogin extends StatelessWidget {
  const PasswordLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var PasswordLogin_text = Text(
        "密碼登入",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        )
    );

    var textfield = TextField(
      maxLines: 1,
      maxLength: 8,
      style: TextStyle(fontSize: 30.0),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: '請輸入密碼',
        hintStyle: TextStyle(fontSize: 30.0),
        contentPadding: EdgeInsets.only(left: 15, top: 12, bottom: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 6, color: Color.fromARGB(255, 111, 183, 183)),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );

    var confirmbutton = ElevatedButton(
      child: Text('確認'),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/Captain_Home');
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
                  PasswordLogin_text,
                  textfield,
                  confirmbutton,
                ]
            ),
          ),
        )
    );
  }
}