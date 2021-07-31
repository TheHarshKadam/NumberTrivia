import 'package:flutter/material.dart';
import 'dart:async';
import 'package:number_trivia/pages/home.dart';
import 'package:number_trivia/provider/darkMode.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      return ThemeProvider();
    },
    // ignore: missing_return
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            builder: (context, widget) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, widget),
                maxWidth: 1200,
                minWidth: 450,
                defaultScale: true,
                breakpoints: [
                  ResponsiveBreakpoint.resize(450, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
                  ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ]),
            themeMode: themeProvider.themeMode,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            home: splash_screen(),
          );
        },
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
