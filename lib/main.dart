import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './Checker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import './Question.dart';

Checker c = new Checker();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Flutter",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Quiz(),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> score = [];
  // List<bool> cans = [true, false, true];
  // int qnum = 0;
  // List<String> quest = [
  //   "Everything in flutter is widget",
  //   "Flutter is based on Java Language",
  //   "Widgets in flutter are recognised as Stateless and Stateful"
  // ];

  void check(bool yourans) {
    bool ans = c.answer();
    setState(() {
      if (c.finished() == true) {
        Alert(
          context: context,
          title: "Done!",
          desc: "You have reached limit",
        ).show();
        c.reset();
        score = [];
      } else {
        if (ans == yourans) {
          score.add(Icon(
            Icons.check,
            color: Colors.lightGreen,
          ));
        } else {
          score.add(
            Icon(
              Icons.close,
              color: Colors.redAccent,
            ),
          );
        }
        c.next();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  c.question(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                check(true);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.green[50],
              child: Text(
                "TRUE",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                check(false);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.red[50],
              child: Text(
                "FALSE",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          )),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: score == [] ? [Icon(Icons.no_encryption)] : score,
            ),
          )
        ],
      ),
    );
  }
}
