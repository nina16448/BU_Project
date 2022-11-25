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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var login_text = Text(
        "登入",
        style: TextStyle(
          color: Color.fromARGB(255, 56, 144, 189),
          fontSize: 50,
          fontWeight: FontWeight.w700,
        )
    );

    var textfield = TextField(
      maxLines: 1,
      maxLength: 8,
      cursorColor: const Color.fromARGB(255, 135, 168, 202),
      style: const TextStyle(color: Color.fromARGB(255, 30, 43, 51)),
      decoration: InputDecoration(
        labelStyle: const TextStyle(
            color: Color.fromARGB(255, 126, 126, 126)),
        contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        hintText: '請輸入名稱/ID',
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 126, 126, 126),
        ),
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: const Color.fromARGB(255, 135, 168, 202),
      ),
    );

    var confirmbutton = ElevatedButton(
      child: Text('確認'),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/Login_Choice');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 56, 144, 189),
        textStyle: TextStyle(fontSize: 30.0),
      ),
    );

    return Container(
      decoration: const BoxDecoration(
        //背景圖片
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            // image: NetworkImage('https://i.imgur.com/Ze7TiVQ.png'),
            fit: BoxFit.cover,
          )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              login_text,
              textfield,
              confirmbutton,
            ]
          ),
        )
      )
    );
  }
}