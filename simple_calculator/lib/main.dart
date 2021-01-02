import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  // Calculator Logic
  String output = "0";
  String _out = "0";
  double num1 = 0;
  double num2 = 0;
  String op = "";

  PressedButton(String val) {
    //print(val);
    if (val == "AC") {
      _out = "0";
      num1 = 0;
      num2 = 0;
      op = "";
    } else if (val == "+" || val == "-" || val == "*" || val == "/") {
      num1 = double.parse(output);
      op = val;
      _out = "0";
      output = output + val;
    } else if (val == ".") {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + val;
      }
    } else if (val == "=") {
      num2 = double.parse(output);

      if (op == "+") {
        _out = (num1 + num2).toString();
      }

      if (op == "-") {
        _out = (num1 - num2).toString();
      }

      if (op == "*") {
        _out = (num1 * num2).toString();
      }

      if (op == "/") {
        _out = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
    } else {
      _out = _out + val;
    }

    setState(() {
      output = double.parse(_out).toStringAsFixed(2);
    });
  }

  // Button Widget
  Widget calcBtn(String btnval) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFF4A4E69),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF22223B),
                offset: Offset(2.0, 2.0),
                blurRadius: 10.0,
                spreadRadius: 1.5),
          ],
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(30.0),
          child: Text(
            btnval,
            style: TextStyle(fontSize: 25.0, color: Color(0xFFF2E9E4)),
          ),
          onPressed: () => PressedButton(btnval),
        ),
      ),
    );
  }

  // Build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9A8C98),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
              child: Text(
                output,
                style: TextStyle(fontSize: 60.0, color: Color(0xFFF2E9E4)),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 2.0,
                color: Colors.white,
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: [
                    calcBtn("AC"),
                    calcBtn("<"),
                    calcBtn("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    calcBtn("1"),
                    calcBtn("2"),
                    calcBtn("3"),
                    calcBtn("*"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    calcBtn("4"),
                    calcBtn("5"),
                    calcBtn("6"),
                    calcBtn("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    calcBtn("7"),
                    calcBtn("8"),
                    calcBtn("9"),
                    calcBtn("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    calcBtn("."),
                    calcBtn("0"),
                    calcBtn("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
