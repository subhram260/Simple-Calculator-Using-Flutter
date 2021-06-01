import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  operation(String btntext) {
    if (btntext == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      output = "0";
      operand = "0";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "/" ||
        btntext == "x") {
      num1 = double.parse(_output);
      operand = btntext;
      _output = "0";
    } else if (btntext == "=") {
      num2 = double.parse(_output);

      if (operand == "+") _output = (num1 + num2).toString();
      if (operand == "-") _output = (num1 - num2).toString();
      if (operand == "x") _output = (num1 * num2).toString();
      if (operand == "/") _output = (num1 / num2).toString();
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + btntext;
    }
    setState(() {
      output = double.parse(_output).toString();
    });
  }

  Widget button(String text, Color color) {
    return Expanded(
        child: RawMaterialButton(
      shape: Border.all(color: Colors.black, width: 1),
      onPressed: () {
        operation(text);
      },
      child: Text(
        text,
        style:
            TextStyle(fontSize: 30, color: color, fontWeight: FontWeight.w600),
      ),
      splashColor: Colors.black,
      fillColor: Colors.black,
      padding: EdgeInsets.all(30.0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Calculator",
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                child: Text(
                  output,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                color: Colors.black,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.only(bottom: 2),
              )),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  button("7", Colors.white),
                  SizedBox(
                      //    width: 2,
                      ),
                  button("8", Colors.white),
                  SizedBox(
                      //   width: 2,
                      ),
                  button("9", Colors.white),
                  SizedBox(
                      //     width: 2,
                      ),
                  button("/", Colors.blueAccent),
                ],
              ),
              SizedBox(
                  //   height: 2,
                  ),
              Row(
                children: [
                  button("4", Colors.white),
                  //SizedBox(
                  //width: 2,
                  // ),
                  button("5", Colors.white),
                  //SizedBox(
                  // width: 2,
                  // ),
                  button("6", Colors.white),
                  SizedBox(
                      // width: 2,
                      ),
                  button("x", Colors.blueAccent),
                ],
              ),
              SizedBox(
                  // height: 2,
                  ),
              Row(
                children: [
                  button("1", Colors.white),
                  SizedBox(
                      //   width: 2,
                      ),
                  button("2", Colors.white),
                  SizedBox(
                      // width: 2,
                      ),
                  button("3", Colors.white),
                  SizedBox(
                      // width: 2,
                      ),
                  button("-", Colors.blueAccent),
                ],
              ),
              SizedBox(
                  //height: 2,
                  ),
              Row(
                children: [
                  button("0", Colors.white),
                  SizedBox(
                      // width: 2,
                      ),
                  button("C", Colors.white),
                  SizedBox(
                      //  width: 2,
                      ),
                  button("=", Colors.white),
                  SizedBox(
                      //   width: 2,
                      ),
                  button("+", Colors.blueAccent),
                ],
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
