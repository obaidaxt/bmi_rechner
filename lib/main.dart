import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _gewicht = 0;
  double _groesse = 0;
  //  double bmi=_bmi.toStringAsFixed(0);
  @override
  Widget build(BuildContext context) {
    double _bmi = (_gewicht / (_groesse * _groesse / 10000));

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('ideal Gewicht'),
          ),
          body: Container(
              color: Color.fromARGB(255, 0, 0, 0),
              child: Column(children: <Widget>[
                Container(),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 200, 10, 50),
                  padding: EdgeInsets.all(5),
                  color: Colors.green,
                  child: Container(
                    width: 1000,
                    height: 55,
                    color: Colors.white70,
                    child: Center(
                      child: TextFormField(
                        initialValue: '',
                        decoration: InputDecoration(labelText: 'Gewicht in Kg'),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          final gewicht = double.tryParse(value);
                          if (gewicht != null) {
                            setState(() {
                              _gewicht = gewicht;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  color: Colors.green,
                  child: Container(
                    width: 1000,
                    height: 55,
                    color: Colors.white70,
                    child: Center(
                      child: TextFormField(
                        initialValue: '',
                        decoration: InputDecoration(labelText: 'Größe in cm'),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          var groesse = double.tryParse(value);
                          if (groesse != null) {
                            setState(() {
                              _groesse = groesse;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(90),
                  padding: EdgeInsets.all(50),
                  color: Colors.green,
                  child: Container(
                    width: 900,
                    height: 55,
                    color: _bmi > 25 || _bmi < 19 ? Colors.red : Colors.green,
                    child: Text(_bmi.toStringAsFixed(0)),
                  ),
                ),
              ]))),
    );
  }
}
