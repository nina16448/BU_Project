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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool inputS = false;
  bool inputW = false;
  bool hide = true;
  String ID = '';
  String PW = '';

  final fieldText = TextEditingController();
  final fieldTextW = TextEditingController();
  void clearText() {
    fieldText.clear();
    fieldTextW.clear();
  }

  @override
  Widget build(BuildContext context) {
    var login_text = const Text("登入",
        style: TextStyle(
          color: Color.fromARGB(255, 82, 82, 82),
          fontSize: 32,
          // fontWeight: FontWeight.w700,
        ));

    var password = TextFormField(
      obscureText: hide,
      controller: fieldTextW,
      textAlign: TextAlign.start,
      cursorColor: const Color.fromARGB(255, 135, 168, 202),
      style: const TextStyle(color: Color.fromARGB(255, 30, 43, 51)),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        focusColor: const Color.fromARGB(255, 255, 255, 255),
        hoverColor: Color.fromARGB(255, 230, 230, 230),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: '請輸入密碼',
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 126, 126, 126),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          color: const Color.fromARGB(255, 135, 168, 202),
          onPressed: () {
            setState(() {
              hide = !hide;
            });
          },
          icon: hide ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
      ),
      onChanged: (value) {
        setState(() {
          print(value);
          inputW = (value.isEmpty) ? false : true;
          PW = value;
          print(inputW);
        });
      },
    );

    var textfield = TextFormField(
      controller: fieldText,
      textAlign: TextAlign.start,
      cursorColor: const Color.fromARGB(255, 135, 168, 202),
      style: const TextStyle(color: Color.fromARGB(255, 30, 43, 51)),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        focusColor: const Color.fromARGB(255, 255, 255, 255),
        hoverColor: Color.fromARGB(255, 230, 230, 230),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: '請輸入名稱/ID',
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 126, 126, 126),
        ),
      ),
      onChanged: (value) {
        setState(() {
          print(value);
          inputS = (value.isEmpty) ? false : true;
          ID = value;
          print(inputS);
        });
      },
    );

    var confirmbutton = CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 105, vertical: 10),
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 135, 168, 202),
      disabledColor: Color.fromARGB(255, 196, 196, 196),
      onPressed: (inputS && inputW)
          ? () {
              setState(() {
                now_login.title = ID;
                clearText();
                inputS = false;
                if (idRight) {
                  (_cheak_ID(ID, PW))
                      ? Navigator.pushNamed(context, '/Captain_Home')
                      : Navigator.pushNamed(context, '/FisherHome');
                }
              });
            }
          : null,
      child: const Text(
        '確認',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 20.0,
          fontFamily: 'GenJyuu',
          // decoration: TextDecoration.underline,
        ),
      ),
    );

    return Container(
        decoration: const BoxDecoration(
            //背景圖片
            image: DecorationImage(
          image: AssetImage('assets/images/login.jpg'),
          // image: NetworkImage('https://i.imgur.com/Ze7TiVQ.png'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    login_text,
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: textfield,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: password,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    confirmbutton,
                    const SizedBox(
                      height: 60,
                    ),
                  ]),
            )));
  }
}

bool _cheak_ID(String ID, String PW) {
  //判斷是漁工還是船長
  if (ID.length > 3)
    return true;
  else
    return false;
}
