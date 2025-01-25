import 'package:flutter/material.dart';

// Result Page with Custom Styling
class ResultPage extends StatelessWidget {
  final String bmiResult;

  ResultPage({required this.bmiResult});

  // BMI Interpretation Logic
  String _getInterpretation() {
    double bmi = double.parse(bmiResult);
    if (bmi >= 25) return 'Overweight';
    if (bmi > 18.5) return 'Normal Weight';
    return 'Underweight';
  }

  Color _getResultColor() {
    double bmi = double.parse(bmiResult);
    if (bmi >= 25) return Colors.orange;
    if (bmi > 18.5) return Colors.green;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A5ACD),
              Color(0xFF7B68EE),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'BMI RESULT',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      _getInterpretation(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _getResultColor(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'RECALCULATE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}