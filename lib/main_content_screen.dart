import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/about_page.dart';
import 'package:portfolio_v2/view_utils.dart';
import 'package:portfolio_v2/work_list_page.dart';
import 'package:responsive_builder/responsive_builder.dart';
/// O que vou ter que fazer: tirar o onTap do CustomAppBarItem
///
///
///

int currentBarIndex = 0;

class MainContentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainContentScreenState();
}

class MainContentScreenState extends State<MainContentScreen> {
  List<CustomAppBarItem> appFlows ;

  @override
  void initState() {
    super.initState();
    appFlows = [
      CustomAppBarItem(
        itemText: 'Img',
        onTap: () {
          setState(() {
            currentBarIndex = 0;
          });
        },
        navigatorKey: GlobalKey<NavigatorState>(),
        rootPage: AboutPage(),
      ),
      CustomAppBarItem(
        itemText: 'Video',
        onTap: () {
          setState(() {
            currentBarIndex = 1;
          });
        },
        navigatorKey: GlobalKey<NavigatorState>(),
        rootPage: WorkListPage(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentFlow = appFlows[currentBarIndex];
    print(currentFlow.navigatorKey);

    return ScreenTypeLayout(
      tablet: WillPopScope(
        onWillPop: () async =>
            !await currentFlow.navigatorKey.currentState.maybePop(),
        child: Scaffold(
          appBar: CustomAppBar(
            height: 70,
            list: appFlows,
          ),
          body: IndexedStack(
            index: currentBarIndex,
            children: appFlows
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
}

Widget _buildIndexedPageFlow(CustomAppBarItem appFlow) => Navigator(
  key: appFlow.navigatorKey,
  onGenerateRoute: (settings) => MaterialPageRoute(
    settings: settings,
    builder: (context) => appFlow.rootPage,
  ),
);

class CustomAppBar extends PreferredSize {
  const CustomAppBar({this.height = kToolbarHeight, this.list}) : assert(list != null);

  final double height;
  final List<CustomAppBarItem> list;

  @override
  Size get preferredSize => Size.fromHeight(height);

  //Brincar com as chaves para manter os fluxos!
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
