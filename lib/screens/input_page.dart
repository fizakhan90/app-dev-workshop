import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // State Variables
  int height = 170;
  int weight = 70;
  int age = 25;

  // Custom Method to Calculate BMI
  void _calculateBMI() {
    double bmiResult = weight / ((height / 100) * (height / 100));
    
    // Navigation to Result Page (Routing Concept)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          bmiResult: bmiResult.toStringAsFixed(1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom Gradient Background (Decoration Concept)
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Custom App Bar (Widget Composition)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'BMI Calculator',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
              ),

              // Height Slider Widget (Custom State Management)
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '$height cm',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white30,
                          thumbColor: Colors.white,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Weight and Age Containers (Custom Widget Composition)
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _buildParameterCard(
                        context,
                        title: 'WEIGHT',
                        value: '$weight kg',
                        onDecrement: () => setState(() => weight--),
                        onIncrement: () => setState(() => weight++),
                      ),
                    ),
                    Expanded(
                      child: _buildParameterCard(
                        context,
                        title: 'AGE',
                        value: '$age',
                        onDecrement: () => setState(() => age--),
                        onIncrement: () => setState(() => age++),
                      ),
                    ),
                  ],
                ),
              ),

              // Calculate Button (Interaction Concept)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _calculateBMI,
                  child: Text(
                    'CALCULATE BMI',
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

  // Reusable Widget Method (Widget Composition)
  Widget _buildParameterCard(
    BuildContext context, {
    required String title,
    required String value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: 'decrement$title',
                backgroundColor: Colors.white12,
                child: Icon(Icons.remove, color: Colors.white),
                onPressed: onDecrement,
              ),
              SizedBox(width: 16),
              FloatingActionButton(
                heroTag: 'increment$title',
                backgroundColor: Colors.white12,
                child: Icon(Icons.add, color: Colors.white),
                onPressed: onIncrement,
              ),
            ],
          ),
        ],
      ),
    );
  }
}