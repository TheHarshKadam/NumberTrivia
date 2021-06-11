import 'package:flutter/material.dart';
import 'dart:async';
import 'package:number_trivia/pages/home.dart';
import 'package:number_trivia/provider/darkMode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      return ThemeProvider();
    },
    // ignore: missing_return
    builder: (context,_) {
      final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: splash_screen(),
      );
    },
  ));
}

class splash_screen extends StatefulWidget {
  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        body: Center(
      child: Image(
        image: AssetImage(
          'assets/facts.png',
        ),
        width: 300.0,
        height: 300.0,
      ),
    ));
  }
}
