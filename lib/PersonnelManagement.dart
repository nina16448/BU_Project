// ignore_for_file: file_names
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'class/Globals.dart';
import 'class/EditPage.dart';
import 'class/Timeout__Warning.dart';
import 'class/Choose_Button.dart';
import 'class/Decision_Button.dart';
import 'class/drawer.dart';
import 'class/list.dart';
import 'class/top_bar.dart';
import 'class/Settinglist.dart';

// ignore: camel_case_types
class Management extends StatefulWidget {
  const Management({Key? key}) : super(key: key);

  @override
  State<Management> createState() => _Management();
}

// ignore: camel_case_types
class _Management extends State<Management> {
  void updateList(String value) {}
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      //主體是Container
      decoration: const BoxDecoration(
          //背景圖片
          image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        // image: NetworkImage('https://i.imgur.com/Ze7TiVQ.png'),
        fit: BoxFit.cover,
      )),

      child: Scaffold(
        key: _scaffoldKey,
        drawer: MyDrawer(
          state: 2,
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 100,
          leading: IconButton(
            iconSize: 33.0,
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 55, 81, 136),
            ),
            // ignore: avoid_print
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          title: Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(' '),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom:
                        2, // This can be the space you need between text and underline
                  ),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Color.fromARGB(255, 135, 168, 202),
                    width: 2, // This would be the width of the underline
                  ))),
                  child: const Text(
                    '               人員管理',
                    style: TextStyle(
                      color: Color.fromARGB(255, 82, 82, 82),
                      fontSize: 23.0,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const Text('             '),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              // TimeList(),

              Expanded(child: ManList()),
            ],
          ),
        ),
        floatingActionButton: OpenContainer(
            //點開會打開的搜尋欄
            openBuilder: (_, closeContainer) => //點開後長怎樣，連接到list.dart
                EditPage(Namelist(' '), false, closeContainer),
            onClosed: (res) => setState(() {}),
            // tappable: false,
            closedColor: const Color.fromARGB(255, 237, 110, 74),
            closedElevation: 6,
            closedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(500),
            ),
            closedBuilder: (_, openContainer) {
              return const SizedBox(
                height: 70,
                width: 70,
                child: Center(
                  child: Icon(
                    size: 40,
                    Icons.person_add_alt_1,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
