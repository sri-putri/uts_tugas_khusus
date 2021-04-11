import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: BMICalculator(),
      ),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _ComputeBMI createState() => _ComputeBMI();
}

class _ComputeBMI extends State {
  TextEditingController tfweight = TextEditingController();
  TextEditingController tfheight = TextEditingController();
  String output = "";
  String category = "";

  void computeBMI() {
    var weight;
    var height;
    var bmi;

    weight = double.parse(tfweight.text);
    height = double.parse(tfheight.text);

    bmi = weight / pow((height / 100), 2);

    setState(() {
      output = "Your BMI is : " + bmi.toString();
      if (bmi < 18.5) {
        category = "Underweight";
      } else if (bmi < 24.99) {
        category = "Normal Range";
      } else if (bmi < 29.9) {
        category = "Overweight";
      } else if (bmi < 34.99) {
        category = "Obese class 1";
      } else if (bmi < 39.99) {
        category = "Obase class 2";
      } else if (bmi > 40) {
        category = "Obase class 3";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(children: [
        TextField(
            controller: tfweight,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Please input weight value",
                labelText: "Weight: ",
                suffixText: "kg",
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ))),
        Divider(),
        TextField(
          controller: tfheight,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: "Please input height value",
              labelText: "Height: ",
              suffixText: "cm",
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey,
              )),
        ),
        Row(
          children: [
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  computeBMI();
                },
                child: Text("Compute"),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            )
          ],
        ),
        Text(
          output,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          category,
          style: TextStyle(fontSize: 20.0, color: Colors.red),
        ),
      ]),
    );
  }
}
