import 'dart:math';
import 'Globals.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class Notice {
  Notice(this.title, this.body, [this.isExpanded = false]);
  String title;
  List<String> body;
  bool isExpanded;
}

List<Notice> getList() {
  return [
    Notice('12/3 超時通知', ['60 分鐘']),
    Notice('11/6 超時通知', ['99 分鐘']),
    Notice('11/5 超時通知', ['30 分鐘']),
    Notice('11/4 超時通知', ['60 分鐘']),
    Notice('11/3 超時通知', ['30 分鐘']),
    Notice('11/2 超時通知', ['60 分鐘']),
  ];
}

class TimeList extends StatefulWidget {
  const TimeList({Key? key}) : super(key: key);

  @override
  State<TimeList> createState() => _TimeList();
}

class _TimeList extends State<TimeList> {
  final List<Notice> _notices = getList();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 0, right: 20, bottom: 50),
      children: <Widget>[
        _noticelist(),
      ],
    );
  }

  Widget _noticelist() {
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.only(bottom: 0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _notices[index].isExpanded = !isExpanded;
        });
      },
      children: _notices.map<ExpansionPanel>((Notice notic) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              subtitle: Text('共${notic.body.length}筆'),
              leading: Icon(
                Icons.warning,
                color: Color.fromARGB(255, 226, 67, 67),
              ),
              title: Text(
                notic.title,
                style: TextStyle(
                  color: Color.fromARGB(255, 82, 82, 82),
                  fontSize: 20.0,
                ),
              ),
            );
          },
          body: Container(
            child: strlist(notic.body),
          ),
          isExpanded: notic.isExpanded,
        );
      }).toList(),
    );
  }

  Widget strlist(List<String> s) {
    return Column(
      children: List<Widget>.generate(
        s.length,
        (idx) {
          return ListTile(
            title: Text(s[idx]),
          );
        },
      ).toList(),
    );
  }
}
