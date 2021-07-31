import 'package:flutter/material.dart';
import 'package:number_trivia/pages/settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController _textFieldController = TextEditingController();

  String fact;
  int number;

  void fetchDataForTrivia() async {
    http.Response response;
    response = await http.get(Uri.http('numbersapi.com', 'random/trivia'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      setState(() {
        fact = response.body;
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
        fact = response.body;
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
        fact = response.body;
      });
    }
  }

  void userInpuForTrivia() async {
    http.Response response;
    response = await http.get(Uri.http('numbersapi.com', '$number/trivia'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      setState(() {
        fact = response.body;
      });
    }
  }

  void userInputForDate() async {
    http.Response response;
    response =
        await http.get(Uri.http('numbersapi.com', '$number/$number/date'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      setState(() {
        fact = response.body;
      });
    }
  }

  void userInputForYear() async {
    http.Response response;
    response = await http.get(Uri.http('numbersapi.com', '$number/year'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      setState(() {
        fact = response.body;
      });
    }
  }

  @override
  void initState() {
    fetchDataForTrivia();
    fetchDataForYear();
    fetchDataForDate();
    userInpuForTrivia();
    userInputForDate();
    userInputForYear();
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
                onChanged: (value) {
                  number = int.parse(value);
                },
                decoration: InputDecoration(
                  hintText: "Enter Year",
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    userInputForYear();
                    setState(() {
                      Navigator.of(context).pop();
                    });
                    setState(() {
                      _textFieldController.clear();
                    });
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
              title: Text('Enter a number'),
              content: TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.purple[400],
                autofocus: true,
                controller: _textFieldController,
                onChanged: (value) {
                  number = int.parse(value);
                },
                //decoration: InputDecoration(hintText: "MM/DD"),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    userInputForDate();
                    setState(() {
                      Navigator.of(context).pop();
                    });
                    setState(() {
                      _textFieldController.clear();
                    });
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
                onChanged: (value) {
                  number = int.parse(value);
                },
                decoration: InputDecoration(hintText: "Enter any number"),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    userInpuForTrivia();
                    setState(() {
                      Navigator.pop(context);
                    });
                    setState(() {
                      _textFieldController.clear();
                    });
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

    var size = MediaQuery.of(context).size;
    print(size.width);
    return Scaffold(
      //backgroundColor: Colors.black54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 60.0,
                    ),
                    Row(
                      children: [
                        SafeArea(child: SizedBox(height: 30.0.sp)),
                        Text(
                          'NumberTrivia',
                          style: TextStyle(
                            fontSize: 36.0.sp,
                            fontWeight: FontWeight.bold,
                            //color: Colors.white
                          ),
                        ),
                        SizedBox(
                          width: 100.0,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.settings_outlined,
                            size: 30.0.sp,
                            //color: Colors.white,
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
                      height: 40.0,
                    ),
                    Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      //color: Colors.grey[900],
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(fact.toString(),
                            style: TextStyle(
                              fontSize: 18.0.sp,
                              color: Colors.purple[400],
                            )),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 50,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              fetchDataForYear();
                            },
                            onLongPress: () {
                              return _showDialogForYear();
                            },
                            child: Text(
                              'Random Year',
                              style: TextStyle(fontSize: 14.0.sp),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.purple[400]),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                )),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              fetchDataForDate();
                            },
                            onLongPress: () {
                              return _showDialogForDate();
                            },
                            child: Text(
                              'Random Dates',
                              style: TextStyle(fontSize: 14.0.sp),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.purple[400]),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
                            child: ElevatedButton(
                              onPressed: () {
                                fetchDataForTrivia();
                              },
                              onLongPress: () {
                                return _showDialogForTrivia();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'RANDOM TRIVIA',
                                  style: TextStyle(fontSize: 18.0.sp),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.purple[400]),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
