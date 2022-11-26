import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'Login_Page.dart';
import 'Login_Choice.dart';
import 'PassowrdLogin.dart';
import 'FaceIDLogin.dart';
import 'Captain_Home.dart';
import 'time.dart';
import 'fisherHome.dart';
import 'class/Choose_Button.dart';
import 'PersonnelManagement.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _scaffoldKey,
      debugShowCheckedModeBanner: false, //讓debug那條不顯示
      title: 'fishermen\'s service management',
      theme: ThemeData(
          fontFamily: 'GenJyuu',
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.windows: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal),
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal),
            TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal),
            TargetPlatform.macOS: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal),
          })), //字體
      routes: {
        '/': (context) => const HomePage(), //首頁
        '/Login_Choice': (context) => const Login_Choice(),
        '/PasswordLogin': (context) => const PasswordLogin(),
        '/FaceIDLogin': (context) => const FaceIDLogin(),
        '/Captain_Home': (context) => const Captain_Home(),
        '/time': (context) => const Timeout(),
        '/Management': (context) => const Management(),
        '/FisherHome': (context) => const FisherHome(),
      },
    );
  }
}
