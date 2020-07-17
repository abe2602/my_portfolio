import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/main_content_screen.dart';
import 'package:portfolio_v2/presentation/about/about_page.dart';
import 'package:portfolio_v2/presentation/contact/contact_page.dart';
import 'package:portfolio_v2/presentation/work_list/work_list_page.dart';

void main() {
  Router.appRouter
    ..define(
      '/',
      handler: Handler(
        handlerFunc: (context, params) => MainContentScreen(),
      ),
    )
    ..define(
      'about',
      handler: Handler(
        handlerFunc: (context, params) => AboutPage(),
      ),
    )
    ..define(
      'work',
      handler: Handler(
        handlerFunc: (context, params) => WorkListPage(),
      ),
    )
    ..define(
      'hey',
      handler: Handler(
        handlerFunc: (context, params) => ContactPage(),
      ),
    );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '<3 Bruno Abe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Router.appRouter.generator,
    );
  }
}
