import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  @override
  createState() {
    return CountPageState();
  }
}

class CountPageState extends State<CountPage> {
  final _style = new TextStyle(fontSize: 20, color: Colors.black38);

  int _x = 1, _y = 1;
  String _instructions = "";

  Color defaultColor = Colors.amber.shade100;
  Color activeColor = Colors.amber;

  void setUpValue() => {
    setState(() {
      _y++;
      evaluar();
    })
  };

  void setRightValue() => {
    setState(() {
      _x++;
      evaluar();
    })
  };

  void setLeftValue() => {
    setState(() {
      _x--;
      evaluar();
    })
  };

  void setDownValue() => {
    setState(() {
      _y--;
      evaluar();
    })
  };

  void evaluar() {
    _instructions = "";
    if (_y > 3) {
      _instructions = "Te has salido del límite superior, ";
      _x = 1; _y = 1;
    } else if (_y < 1) {
      _instructions = "Te has salido del límite inferior, ";
      _x = 1; _y = 1;
    } else if (_x > 3) {
      _instructions = "Te has salido del límite derecho, ";
      _x = 1; _y = 1;
    } else if (_x < 1) {
      _instructions = "Te has salido del límite izquierdo, ";
      _x = 1; _y = 1;
    }
    _instructions += "x: $_x, y: $_y";
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Examen 1er Periodo uwu'),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 85,
                    width: 260,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          color: (_x == 1 && _y==3)?activeColor:defaultColor,
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          color: (_x == 2 && _y==3)?activeColor:defaultColor,
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          color: (_x == 3 && _y==3)?activeColor:defaultColor,
                    ),
                  ],
                ),
              ),
              Container(
                height: 85,
                width: 260,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      color: (_x == 1 && _y==2)?activeColor:defaultColor,
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      color: (_x == 2 && _y==2)?activeColor:defaultColor,
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      color: (_x == 3 && _y==2)?activeColor:defaultColor,
                    ),
                  ],
                ),
              ),
              Container(
                height: 85,
                width: 260,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      color: (_x == 1 && _y==1)?activeColor:defaultColor,
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      color: (_x == 2 && _y==1)?activeColor:defaultColor,
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      color: (_x == 3 && _y==1)?activeColor:defaultColor,
                    ),
                  ],
                ),
              ),
              (Text('$_instructions', style: _style)),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                    ),
                    FlatButton(
                        onPressed: setUpValue,
                        child: Icon(Icons.arrow_drop_up)),
                    Container(
                      padding: const EdgeInsets.all(8),
                    ),
                    FlatButton(
                        onPressed: setLeftValue,
                        child: Icon(Icons.arrow_left)),
                    Container(
                      padding: const EdgeInsets.all(8),
                    ),
                    FlatButton(
                        onPressed: setRightValue,
                        child: Icon(Icons.arrow_right)),
                    Container(
                      padding: const EdgeInsets.all(8),
                    ),
                    FlatButton(
                        onPressed: setDownValue,
                        child: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
