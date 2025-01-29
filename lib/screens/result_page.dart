// screens/result_page.dart
import 'package:flutter/material.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String category;
  final String healthRisk;
  final int age;
  final String gender;

  const ResultPage({
    required this.bmiResult,
    required this.category,
    required this.healthRisk,
    required this.age,
    required this.gender,
  });

  Color _getCategoryColor() {
    switch (category) {
      case 'Severe Underweight':
      case 'Moderate Underweight':
      case 'Mild Underweight':
        return Colors.blue;
      case 'Normal Weight':
        return Colors.green;
      case 'Overweight':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF6A5ACD), Color(0xFF7B68EE)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Your Results',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Card(
                  color: Colors.white10,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(
                              gender == 'Male' ? Icons.male : Icons.female,
                              color: Colors.white,
                              size: 32,
                            ),
                            Text(
                              gender,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 32,
                            ),
                            Text(
                              '$age years',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 24),
                Expanded(
                  flex: 2,
                  child: Card(
                    color: Colors.white10,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            category,
                            style: TextStyle(
                              color: _getCategoryColor(),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
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
                          Text(
                            'BMI',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 16),
                Expanded(
                  child: Card(
                    color: Colors.white10,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Health Risk:',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            healthRisk,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => InputPage()),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'CALCULATE AGAIN',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}