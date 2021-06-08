import 'package:flutter/material.dart';
import 'package:number_trivia/pages/settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController _textFieldController = TextEditingController();
  String factTrivia;
  String factYear;
  String factDate;
  void fetchDataForTrivia() async {
    http.Response response;
    response = await http.get(Uri.http('numbersapi.com', 'random/trivia'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      setState(() {
        factTrivia = response.body;
      });
    }
  }

  void fetchDataForYear() async {
    http.Response response;
    response = await http.get(Uri.http('numbersapi.com', 'random/year'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      setState(() {
        factYear = response.body;
      });
    }
  }

  void fetchDataForDate() async {
    http.Response response;
    response = await http.get(Uri.http('numbersapi.com', 'random/date'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      setState(() {
        factDate = response.body;
      });
    }
  }

  @override
  void initState() {
    fetchDataForTrivia();
    fetchDataForYear();
    fetchDataForDate();
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
      body: Column(
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
          SizedBox(
            height: 30.0,
          ),
          Card(
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                factYear.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple[400],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 300.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    fetchDataForYear();
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
                    fetchDataForDate();
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
                    fetchDataForTrivia();
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
    );
  }
}
