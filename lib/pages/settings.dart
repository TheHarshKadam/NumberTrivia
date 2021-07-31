import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:number_trivia/provider/darkMode.dart';
import 'package:number_trivia/widget/toggle_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  _launchAPI() async {
    const url = ('http://numbersapi.com/');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ('Link could not launch, Maybe you are offline :/');
    }
  }

  _launchGit() async {
    const url = ('https://github.com/TheHarshKadam');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ('Pls check your internet connection :/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'Dark'
        : 'Light';
    return Scaffold(
      //backgroundColor: Colors.black54,
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
                  //color: Colors.white,
                ),
              ),
              Text(
                'Settings',
                style: TextStyle(
                  //color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80.0,
          ),
          Card(
            elevation: 0.0,
            //color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(
                  'Theme',
                  style: TextStyle(fontSize: 19.0.sp),
                ),
                subtitle: Text(
                  '$text',
                  style: TextStyle(fontSize: 14.0.sp),
                ),
                trailing: ChangeThemeButton(),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
            elevation: 0.0,
            //color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(
                  'Help Text',
                  style: TextStyle(
                    fontSize: 18.0.sp,
                  ),
                ),
                subtitle: Text(
                  'Long press on any button and enter your lucky number to see the fact behind that number',
                  style: TextStyle(fontSize: 13.0.sp),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                onLongPress: () {
                  return _launchAPI();
                },
                title: Text(
                  'Know More About Numbers?',
                  style: TextStyle(
                    fontSize: 18.0.sp,
                  ),
                ),
                subtitle: Text(
                  'Contribute your number, year, date facts to API. Just tap and hold this.',
                  style: TextStyle(
                    fontSize: 13.0.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Card(
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(65.0, 55.0, 30.0, 0.0),
              child: ListTile(
                onTap: () {
                  _launchGit();
                },
                title: Text('Developed By - TheHarshKadam'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
