import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/view_utils.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'presentation/about/about_page.dart';
import 'presentation/work_list/work_list_page.dart';
import 'dart:html' as html;

class MainContentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainContentScreenState();
}

class MainContentScreenState extends State<MainContentScreen> {
  List<CustomAppBarItem> _appFlows;
  int _currentBarIndex = 0;

  @override
  void initState() {
    super.initState();
    _appFlows = [
      CustomAppBarItem(
        itemText: 'About',
        onTap: () {
          setState(() {
            _currentBarIndex = 0;
          });
        },
        navigatorKey: GlobalKey<NavigatorState>(),
        rootPage: 'about',
      ),
      CustomAppBarItem(
        itemText: 'Work',
        onTap: () {
          setState(() {
            _currentBarIndex = 1;
          });
        },
        navigatorKey: GlobalKey<NavigatorState>(),
        rootPage: 'work',
      )
    ];
  }

  @override
  Widget build(BuildContext context) => ScreenTypeLayout(
        tablet: WillPopScope(
          onWillPop: () async => !await _appFlows[_currentBarIndex]
              .navigatorKey
              .currentState
              .maybePop(),
          child: Scaffold(
            appBar: CustomAppBar(
              height: 70,
              list: _appFlows,
            ),
            body: IndexedStack(
              index: _currentBarIndex,
              children: _appFlows
                  .map(
                    _buildIndexedPageFlow,
                  )
                  .toList(),
            ),
          ),
        ),
        mobile: Scaffold(
          body: AboutPage(),
        ),
      );
}

Widget _buildIndexedPageFlow(CustomAppBarItem appFlow) {
  return Navigator(
    key: appFlow.navigatorKey,
    initialRoute: appFlow.rootPage,
    onGenerateRoute: Router.appRouter.generator,
  );
}

class CustomAppBar extends PreferredSize {
  const CustomAppBar({this.height = kToolbarHeight, this.list})
      : assert(list != null);

  final double height;
  final List<CustomAppBarItem> list;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      color: const Color(0xFFF5F5F5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InitialsWithDot(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              list[0],
              list[1],
            ],
          ),
        ],
      ),
    );
  }
}

class InitialsWithDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "BA",
          textScaleFactor: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
