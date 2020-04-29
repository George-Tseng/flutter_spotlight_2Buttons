import 'package:flutter/material.dart';
import 'package:torch/torch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Flutter Flashlight Demo'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _switch = false;

  void switchOn(){
    setState(() {
      _switch = true;
    });
  }

  void switchOff(){
    setState(() {
      _switch = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //OFF Button
              RaisedButton(
                child: Text('OFF'),
                onPressed: (){ 
                  switchOff();
                  Torch.turnOff();
                },
              ),
              //ON Button
              RaisedButton(
                child: Text('ON'),
                onPressed: (){
                  switchOn();
                  Torch.turnOn();
                },
              ),
            ]
          ),
        ),
      ),
    );
  }
}
