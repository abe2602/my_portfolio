import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/presentation/contact/contact_page.dart';
import 'package:portfolio_v2/view_utils.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'presentation/about/about_page.dart';
import 'presentation/work_list/work_list_page.dart';

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
        rootPage: AboutPage(),
      ),
      CustomAppBarItem(
        itemText: 'Work',
        onTap: () {
          setState(() {
            _currentBarIndex = 1;
          });
        },
        navigatorKey: GlobalKey<NavigatorState>(),
        rootPage: WorkListPage(),
      ),
      CustomAppBarItem(
        itemText: 'Contact',
        onTap: () {
          setState(() {
            _currentBarIndex = 2;
          });
        },
        navigatorKey: GlobalKey<NavigatorState>(),
        rootPage: ContactPage(),
      ),
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
            appBar: _CustomAppBar(
              height: 70,
              list: _appFlows,
            ),
            body: IndexedStack(
              index: _currentBarIndex,
              children: _appFlows
                  .map(
                    (appFlow) => _PageFlow(
                      appFlow: appFlow,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        mobile: WillPopScope(
          onWillPop: () async => !await _appFlows[_currentBarIndex]
              .navigatorKey
              .currentState
              .maybePop(),
          child: Scaffold(
            appBar: _CustomAppBar(
              height: 70,
              list: _appFlows,
            ),
            body: IndexedStack(
              index: _currentBarIndex,
              children: _appFlows
                  .map(
                    (appFlow) => _PageFlow(
                      appFlow: appFlow,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
}

class _PageFlow extends StatelessWidget {
  const _PageFlow({@required this.appFlow}) : assert(appFlow != null);

  final CustomAppBarItem appFlow;

  @override
  Widget build(BuildContext context) => Navigator(
        key: appFlow.navigatorKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          settings: settings,
          builder: (context) => appFlow.rootPage,
        ),
      );
}

class _CustomAppBar extends PreferredSize {
  const _CustomAppBar({this.height = kToolbarHeight, this.list})
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
          _InitialsWithDot(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              list[0],
              list[1],
              list[2],
            ],
          ),
        ],
      ),
    );
  }
}

class _InitialsWithDot extends StatelessWidget {
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
