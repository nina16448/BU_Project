import 'package:animations/animations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:ffi';
import 'dart:collection';
import 'Globals.dart';
import 'EditPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

final List<String> items = [
  '甲板',
  '廚房',
];
String? selectedValue;

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

              child: ListTile(
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
                onTap: () {
                  setState(() {
                    showDataAlert(1, root);
                    print(root.title);
                  });
                },
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

  showDataAlert(int state, Namelist root) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: Text(
              (state == 0) ? "新增資料" : "修改資料",
              style: TextStyle(fontSize: 24.0),
            ),
            content: Container(
              height: 400,
              width: 500,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(6, 6, 6, 0),
                      child: Text(
                        "姓名",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '請輸入姓名';
                          }
                          return null;
                        },
                        initialValue: root.title,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          // hintText: 'Enter Id here',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(6, 6, 6, 0),
                      child: Text(
                        "ID",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        readOnly: true,
                        initialValue: '002',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          // hintText: 'Enter Id here',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(6, 6, 6, 0),
                      child: Text(
                        "工作場所",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 30),
                      child: TextFormField(
                        initialValue: '工作場所',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          // hintText: 'Enter Id here',
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 135, 168, 202),
                          // fixedSize: Size(250, 50),
                        ),
                        child: const Text(
                          "確認",
                          style: TextStyle(
                            fontFamily: 'GenJyuu',
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16.0,
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
