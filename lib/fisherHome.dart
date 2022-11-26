import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'class/Choose_Button.dart';
import 'class/Decision_Button.dart';
import 'class/drawer.dart';
import 'class/list.dart';
import 'class/top_bar.dart';
import 'class/Globals.dart';

class FisherHome extends StatefulWidget {
  const FisherHome({Key? key}) : super(key: key);

  @override
  State<FisherHome> createState() => _FisherHomeState();
}

// ignore: camel_case_types
class _FisherHomeState extends State<FisherHome> {
  void updateList(String value) {}
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final GlobalKey<StepsState> _key = GlobalKey();
  final PageController controller = PageController(initialPage: 1000);
  List<Namelist> searchList = getList();
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      //主體是Container
      decoration: const BoxDecoration(
          //背景圖片
          image: DecorationImage(
        image: AssetImage('assets/images/fisherman.jpg'),
        fit: BoxFit.cover,
      )),

      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Row(
          children: [
            NavigationRail(
              backgroundColor: Color.fromARGB(255, 135, 168, 202),
              selectedIndex: _selectedIndex,
              groupAlignment: groupAligment,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: labelType,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon:
                      Container(width: 200, child: Icon(Icons.favorite_border)),
                  selectedIcon:
                      Container(width: 200, child: Icon(Icons.favorite)),
                  label: Text('First'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.book),
                  label: Text('Second'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Third'),
                ),
              ],
            ),
            VerticalDivider(thickness: 1, width: 1),
            Expanded(child: Column()),
          ],
        ),
      ),
    );
  }

  Widget _pagechange() {
    return PageView.builder(
      controller: controller,
      // itemCount: 1000,
      itemBuilder: (context, index) {
        return Steps(namelist: searchList);
      },
      onPageChanged: (int page) {
        setState(() {
          checkState = false;
          print('page: $page');
          print('prev: $prev');
          if (prev != -1) {
            aTime = (prev > page)
                ? aTime.subtract(const Duration(days: 1))
                : (prev == page)
                    ? currentTime
                    : aTime.add(const Duration(days: 1));
            prev = page;
          } else {
            if (page == 1000) prev = 1000;
          }
        });
      },
    );
  }

  void filterSearchResults(String query) {
    List<Namelist> dummySearchList = [];
    dummySearchList.addAll(globalList);
    if (query.isNotEmpty) {
      List<Namelist> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.title.contains(query.toUpperCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        checkState = false;
        searchList.clear();
        searchList.addAll(dummyListData);
        print(searchList.length);
      });
      return;
    } else {
      setState(() {
        searchList.clear();
        // searchList.addAll(getList());
        searchList.addAll(globalList);
        // searchList = globalList;
        print('global size:');
        print(globalList.length);
      });
    }
  }
}
