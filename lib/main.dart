import 'package:flutter/material.dart';
import 'package:portfolio_v2/general_provider.dart';
import 'package:portfolio_v2/main_content_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GeneralProvider(
        child: MaterialApp(
          title: 'Bruno Abe',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainContentScreen(),
        ),
      );
}
