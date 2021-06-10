import 'package:flutter/material.dart';
import 'package:number_trivia/provider/darkMode.dart';
import 'package:number_trivia/widget/toggle_button.dart';
import 'package:provider/provider.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'Dark'
        : 'Light';
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          SizedBox(
            height: 80.0,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80.0,
          ),
          Card(
            child: ListTile(
              title: Text(
                'Theme',
              ),
              subtitle: Text(
                '$text',
              ),
              trailing: ChangeThemeButton(),
            ),
          )
        ],
      ),
    );
  }
}
