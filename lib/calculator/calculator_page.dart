import 'package:flutter/material.dart';
import 'calculator_logic.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final Calculator _calculator = Calculator();
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  void _calculate(String operation) {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case '+':
          _calculator.add(num1, num2);
          break;
        case '-':
          _calculator.subtract(num1, num2);
          break;
        case '*':
          _calculator.multiply(num1, num2);
          break;
        case '/':
          _calculator.divide(num1, num2);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Angka 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Angka 2'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['+', '-', '*', '/'].map((op) {
                return ElevatedButton(
                  onPressed: () => _calculate(op),
                  child: Text(op),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: ${_calculator.result}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}