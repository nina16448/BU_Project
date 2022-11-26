import 'package:animations/animations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:ffi';
import 'dart:collection';
import 'Globals.dart';
import 'EditPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ManList extends StatefulWidget {
  ManList({super.key});

  @override
  State<ManList> createState() => ManListState();
}

class ManListState extends State<ManList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0, right: 10, bottom: 50),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: _item(globalList[index], index),
      ),
      itemCount: globalList.length,
    );
  }

  Widget _item(Namelist root, int index) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Colors.white,
            child: Slidable(
              groupTag: "alll",
              // Specify a key if the Slidable is dismissible.
              key: ValueKey(index),
              // The end action pane is the one at the right or the bottom side.

              endActionPane: ActionPane(
                // dismissible: DismissiblePane(
                //     dismissThreshold: 0.99,
                //     onDismissed: () {
                //       globalList.remove(root);
                //     }),
                extentRatio: 0.1,
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        globalList.remove(root);
                      });
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                  ),
                ],
              ),

              child: OpenContainer(
                //點開會打開的搜尋欄
                openBuilder: (_, closeContainer) => //點開後長怎樣，連接到list.dart
                    EditPage(root, true, closeContainer),
                onClosed: (res) => setState(() {}),
                // tappable: false,
                closedBuilder: (_, openContainer) => ListTile(
                  leading: const Icon(
                    Icons.anchor,
                    color: Color.fromARGB(255, 142, 160, 197),
                  ),
                  title: Text(
                    root.title,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 82, 82, 82),
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text('工作場所'),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
      ],
    );
  }
}
