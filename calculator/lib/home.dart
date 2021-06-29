import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget button(var numm) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + numm;
          });
        },
        child: Text(numm));
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  equal() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CALCULATOR"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 300,
            height: 70,
            color: Colors.blueGrey,
            child: Text(
              result,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button("7"),
              button("8"),
              button("9"),
              button("+"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button("4"),
              button("5"),
              button("6"),
              button("-"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button("1"),
              button("2"),
              button("3"),
              button("*"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: clear(), child: Text("C")),
              button("0"),
              ElevatedButton(onPressed: equal(), child: Text("=")),
              button("/"),
            ],
          ),
        ],
      ),
    );
  }
}
