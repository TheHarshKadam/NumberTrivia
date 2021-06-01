import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    void _showDialogForYear() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Enter any Year'),
              content: Text('Body of Year'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }

    void _showDialogForDate() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Enter any date'),
              content: Text('Body of date'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }

    void _showDialogForTrivia() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Enter your lucky number'),
              content: Text('ALert dialog body'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.0,
          ),
          Text(
            'Number Trivia',
            style: GoogleFonts.carroisGothic(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent[400]),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('YEAR');
                  },
                  onLongPress: () {
                    return _showDialogForYear();
                  },
                  child: Text('Random Year'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('DATE');
                  },
                  onLongPress: () {
                    return _showDialogForDate();
                  },
                  child: Text('Random Dates'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    print('TRIVIA');
                  },
                  onLongPress: () {
                    return _showDialogForTrivia();
                  },
                  child: Text(
                    'RANDOM TRIVIA',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

