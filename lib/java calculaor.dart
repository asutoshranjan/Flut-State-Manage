import 'package:flutter/material.dart';
import 'java/calculator.java';

class JavaCalculator extends StatefulWidget {
  const JavaCalculator({Key? key}) : super(key: key);

  @override
  _JavaCalculatorState createState() => _JavaCalculatorState();
}

class _JavaCalculatorState extends State<JavaCalculator> {
  final number1Controller = TextEditingController();
  final number2Controller = TextEditingController();
  int num1 = 0;
  int num2 = 0;

  int sum = 0;

  @override
  void initState() {
    super.initState();
    number1Controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Java Calculator"),
          centerTitle: true,
          // uses java function to calculate
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 18),
            children: [
              SizedBox(height: 40),
              EnterNumber1(),
              SizedBox(height: 30),
              EnterNumber2(),
              SizedBox(height: 30),
              Text(
                'The sum is $sum',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    sum = calculator(num1, num2).add();
                  });
                },
                shape: StadiumBorder(),
                color: Colors.redAccent,
                child: const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // Input Functionality using text field and storing the number to number1
  Widget EnterNumber1() => TextField(
        controller: number1Controller,
        onSubmitted: (value) => setState(() {
          this.num1 = int.parse(value);
        }),
        decoration: InputDecoration(
          hintText: '1234',
          labelText: 'Number 1',
          prefixIcon: Icon(Icons.format_list_numbered),
          suffixIcon: number1Controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    number1Controller.clear();
                  },
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      );

  // Input Functionality using text field and storing the number to number2
  Widget EnterNumber2() => TextField(
        controller: number2Controller,
        onSubmitted: (value) => setState(() {
          this.num2 = int.parse(value);
        }),
        decoration: InputDecoration(
          hintText: '1234',
          labelText: 'Number 2',
          prefixIcon: Icon(Icons.format_list_numbered),
          suffixIcon: number2Controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    number2Controller.clear();
                  },
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      );
}
