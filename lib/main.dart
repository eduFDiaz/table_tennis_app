import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Table tennis score board',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Table tennis score board'),
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
  String _player1 = 'Pedro';
  String _player2 = 'Andy';

  int _counter1 = 0;
  int _counter2 = 0;

  void _incrementCounter1() {
    if (this._counter1 < 11)
      setState(() {
        _counter1++;
      });
  }

  void _incrementCounter2() {
    if (this._counter2 < 11)
      setState(() {
        _counter2++;
      });
  }

  void _resetBoard() {
    setState(() {
      _counter1 = 0;
      _counter2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Text(
                    this._player1,
                  ),
                  RaisedButton(
                    onPressed: _incrementCounter1,
                    child: Text(
                      this._counter1.toString(),
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ]),
                Column(children: <Widget>[
                  Text(
                    this._player2,
                  ),
                  RaisedButton(
                    onPressed: _incrementCounter2,
                    child: Text(
                      this._counter2.toString(),
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ]),
                Column(children: <Widget>[
                  RaisedButton(
                    onPressed: _resetBoard,
                    child: Text(
                      'Reset Board',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ]),
              ],
            )
          ]),
        ));
  }
}
