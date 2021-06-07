import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_trivia/pages/settings.dart';
import 'package:number_trivia/services/api_code.dart';
import 'dart:convert';
import 'package:http/http.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController _textFieldController = TextEditingController();
  String fact;
  Future fetchData() async {
    Response response;
    response = await get(Uri.https('numbersapi.com', 'random/trivia'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      setState(() {
        fact = response.body;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _showDialogForYear() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text('Enter any Year'),
              content: TextFormField(
                keyboardType: TextInputType.number,
                autofocus: true,
                cursorColor: Colors.purple[400],
                controller: _textFieldController,
                decoration: InputDecoration(
                  hintText: "Enter Year",
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple[400]),
                  ),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text('Enter any date'),
              content: TextFormField(
                cursorColor: Colors.purple[400],
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
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple[400]),
                  ),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text('Enter your lucky number'),
              content: TextFormField(
                cursorColor: Colors.purple[400],
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
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple[400]),
                  ),
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
              height: 60.0,
            ),
            Row(
              children: [
                Text(
                  'NumberTrivia',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 105.0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => settings(),
                        ));
                  },
                ),
              ],
            ),
            Text(
              fact.toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400.0),
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
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple[400]),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('DATE');
                    },
                    onLongPress: () {
                      return _showDialogForDate();
                    },
                    child: Text('Random Dates'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple[400]),
                    ),
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
                      print(fetchData());
                    },
                    onLongPress: () {
                      return _showDialogForTrivia();
                    },
                    child: Text(
                      'RANDOM TRIVIA',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple[400]),
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
