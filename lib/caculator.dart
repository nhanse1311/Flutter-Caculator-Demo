import 'package:flutter/material.dart';

class Caculator extends StatefulWidget {
  String titleApp;

  Caculator(this.titleApp) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CaculatorState();
  }
}

class CaculatorState extends State<Caculator> {
  int numberScreen = 0;
  String numberScreenString = "";
  String numberScreenFinal = "0";
  double sizeNumberScreen = 100.0;
  bool checkForResult = false; // dùng  để kiểm tra xem máy tính đã tính toán hay chưa

  void _btnFromZeroToNine(String numberPress) {
    if (checkForResult == true) {
      numberScreenFinal = "";
      numberScreenString = numberPress;
      checkForResult = false;
    } else {
      numberScreenString = numberPress;
    }
  }// phương thức để nhập số từ bàn phiếm

  void _clearAll() {
    sizeNumberScreen = 100.0;
    numberScreen = 0;
    numberScreenString = "";
    numberScreenFinal = "0";
  } //Cho AC

  void _btnSumAction() {
    var numberSum = new List();
    numberSum.addAll(numberScreenFinal.split("\+"));
    var numberSub = new List();
    numberSub.addAll(numberScreenFinal.split("\-"));

    if (numberSum.length > 1) {
      numberScreen =
          int.parse(numberSum.elementAt(0)) + int.parse(numberSum.elementAt(1));
      numberScreenFinal = "";
      numberScreenString = "${numberScreen}" + "+";
      checkForResult = false;
    } else {
      if (numberSub.length > 1) {
        numberScreen = int.parse(numberSub.elementAt(0)) -
            int.parse(numberSub.elementAt(1));
        numberScreenFinal = "";
        numberScreenString = "${numberScreen}" + "+";
      } else {
        numberScreenString = "+";
      }
      checkForResult = false;
    }
  } // Nút cộng

  void _btnSubAction() {
    var numberSum = new List();
    numberSum.addAll(numberScreenFinal.split("\+"));
    var numberSub = new List();
    numberSub.addAll(numberScreenFinal.split("\-"));
    if (numberSub.length > 1) {
      numberScreen =
          int.parse(numberSub.elementAt(0)) - int.parse(numberSub.elementAt(1));
      numberScreenFinal = "";
      numberScreenString = "${numberScreen}" + "-";
      checkForResult = false;
    } else {
      if (numberSum.length > 1) {
        numberScreen = int.parse(numberSum.elementAt(0)) +
            int.parse(numberSum.elementAt(1));
        numberScreenFinal = "";
        numberScreenString = "${numberScreen}" + "-";
      } else {
        numberScreenString = "-";
      }
      checkForResult = false;
    }
  } // Nút trừ

  void _btnResultAction() {
    var numberSum = new List();
    numberSum.addAll(numberScreenFinal.split("\+"));
    var numberSub = new List();
    numberSub.addAll(numberScreenFinal.split("\-"));
    if (numberSum.length > 1) {
      numberScreen =
          int.parse(numberSum.elementAt(0)) + int.parse(numberSum.elementAt(1));
      numberScreenFinal = "";
      numberScreenString = "${numberScreen}";
      checkForResult = true;
    } else if (numberSub.length > 1) {
      numberScreen =
          int.parse(numberSub.elementAt(0)) - int.parse(numberSub.elementAt(1));
      numberScreenFinal = "";
      numberScreenString = "${numberScreen}";
      checkForResult = true;
    }
  } // Nút bằng

  Widget buildRowOne(String number) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: new Text(
                  number,
                  style: new TextStyle(
                      fontWeight: FontWeight.w300, fontSize: sizeNumberScreen),
                ),
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 0.0),
                height: 100.0,
              )
            ],
          ),
        ),
      ],
    );
  } // Widget để xây dựng màn hình hiển thị số được bấm và được tính toán

  Widget buildButton(String title, Color color) {
    final sizeScreen = MediaQuery.of(context).size;
    return new Column(
      children: <Widget>[
        new Container(
          child: new RaisedButton(
            child: new Text(
              title,
              style: new TextStyle(fontSize: 36.0),
            ),
            color: color,
            onPressed: () {
              if (numberScreenFinal == "0") {
                numberScreenFinal = "";
                numberScreenString = "";
              }
              if (title == "AC") {
                _clearAll();
              }
              if (numberScreenFinal.length < 12) {
                if (title == "1") {
                  _btnFromZeroToNine("1");
                }
                if (title == "2") {
                  _btnFromZeroToNine("2");
                }
                if (title == "3") {
                  _btnFromZeroToNine("3");
                }
                if (title == "4") {
                  _btnFromZeroToNine("4");
                }
                if (title == "5") {
                  _btnFromZeroToNine("5");
                }
                if (title == "6") {
                  _btnFromZeroToNine("6");
                }
                if (title == "7") {
                  _btnFromZeroToNine("7");
                }
                if (title == "8") {
                  _btnFromZeroToNine("8");
                }
                if (title == "9") {
                  _btnFromZeroToNine("9");
                }
                if (title == "+") {
                  _btnSumAction();
                }
                if (title == "-") {
                  _btnSubAction();
                }
                if (title == "=") {
                  _btnResultAction();
                }
                setState(() {
                  numberScreenFinal = numberScreenFinal + numberScreenString;
                  if (numberScreenFinal.length > 5) {
                    sizeNumberScreen = 50.0;
                  }
                });
              }
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0),
            ),
          ),
          decoration: new BoxDecoration(
              color: color,
              borderRadius: new BorderRadius.all(const Radius.circular(50.0))),
          height: sizeScreen.height/8.5,
          width: sizeScreen.width/4.5,
          margin: EdgeInsets.only(top: 2.0),
        )
      ],
    );
  } // Widget để xây dựng các nút bấm

  Widget buildButtonZero(String title, Color color) {
    return new Column(
      children: <Widget>[
        new Container(
          child: new RaisedButton(
            child: new Text(
              title,
              style: new TextStyle(fontSize: 30.0),
            ),
            color: color,
            onPressed: () {
              if (numberScreenFinal != "0") {
                _btnFromZeroToNine("0");
              }
              setState(() {
                numberScreenFinal = numberScreenFinal + numberScreenString;
                if (numberScreenFinal.length > 5) {
                  sizeNumberScreen = 50.0;
                }
              });
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0),
            ),
          ),
          decoration: new BoxDecoration(
              color: color,
              borderRadius: new BorderRadius.all(const Radius.circular(50.0))),
          height: 80.0,
          width: 160.0,
          margin: EdgeInsets.only(top: 20.0),
        )
      ],
    );
  }// Widget dành riêng cho button 0

  @override
  Widget build(BuildContext context) {
    Widget buildRowTwo = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButton("AC", Colors.black12),
          buildButton("+/-", Colors.black12),
          buildButton("%", Colors.black12),
          buildButton("÷", Colors.orangeAccent),
        ],
      ),
    );//Button ( AC, +/-, %, ÷ )
    Widget buildRowThree = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButton("7", Colors.black87),
          buildButton("8", Colors.black87),
          buildButton("9", Colors.black87),
          buildButton("x", Colors.orangeAccent),
        ],
      ),
    );//Button ( 7, 8, 9, x )
    Widget buildRowFour = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButton("4", Colors.black87),
          buildButton("5", Colors.black87),
          buildButton("6", Colors.black87),
          buildButton("-", Colors.orangeAccent),
        ],
      ),
    );//Button ( 4, 5, 6, - )
    Widget buildRowFive = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButton("1", Colors.black87),
          buildButton("2", Colors.black87),
          buildButton("3", Colors.black87),
          buildButton("+", Colors.orangeAccent),
        ],
      ),
    );//Button ( 1, 2, 3, + )
    Widget buildRowSix = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonZero(
            "0",
            Colors.black87,
          ),
          buildButton(".", Colors.black87),
          buildButton("=", Colors.black87),
        ],
      ),
    );//Button ( 0, ., = )
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          buildRowOne(numberScreenFinal),
          buildRowTwo,
          buildRowThree,
          buildRowFour,
          buildRowFive,
          buildRowSix,
        ],
      ),
    );
  }
}
