import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _msg = "Pode Entrar!";

  void _incrementCounter(int count) {
    setState(() {
      _counter += count;

      if (_counter >= 10) {
        _counter = 10;
        _msg = "Restaurante lotado!";
      } else if (_counter < 10 && _counter >= 0)
        _msg = "Pode Entrar!";
      else if (_counter < 0) {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'images/restaurante.jpg',
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pessoas: $_counter',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                          onPressed: () {
                            _incrementCounter(1);
                          },
                          child: Text('+1',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.deepOrangeAccent)),
                      )),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {
                          _incrementCounter(-1);
                        },
                        child: Text('-1',
                            style: TextStyle(
                                fontSize: 40, color: Colors.deepOrangeAccent)),
                      ))
                ],
              ),
              Text(
                _msg,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
