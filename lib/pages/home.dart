import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_trivia/pages/settings.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void _showDialogForYear() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Enter any Year'),
              content: TextFormField(
                keyboardType: TextInputType.number,
                autofocus: true,
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "Enter Year"),
              ),
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
              content: TextFormField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                autofocus: true,
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "MM/DD"),
              ),
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
              content: TextFormField(
                keyboardType: TextInputType.number,
                controller: _textFieldController,
                autofocus: true,
                decoration: InputDecoration(hintText: "Enter any number"),
              ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.0,
            ),
            Row(
              children: [
                Text(
                  'NumberTrivia',
                  style: GoogleFonts.carroisGothic(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.pinkAccent[400]),
                ),
                SizedBox(
                  width: 80.0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 360.0),
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
      ),
    );
  }
}
