import 'package:flutter/material.dart';
import './input_page.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String category;

  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.category,
  });

  // Simple color mapping for categories
  Color _getCategoryColor() {
    switch (category) {
      case 'Underweight':
        return Colors.blue;
      case 'Normal Weight':
        return Colors.green;
      case 'Overweight':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  // Simple emoji mapping for categories
  String _getCategoryEmoji() {
    switch (category) {
      case 'Underweight':
        return '⚡';
      case 'Normal Weight':
        return '💪';
      case 'Overweight':
        return '⚠️';
      default:
        return '❗';
    }
  }

  // BMI Scale information widget
  Widget _buildBMIScale() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BMI Scale:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildScaleItem('Underweight', '< 18.5', Colors.blue),
          _buildScaleItem('Normal Weight', '18.5 - 24.9', Colors.green),
          _buildScaleItem('Overweight', '25 - 29.9', Colors.orange),
          _buildScaleItem('Obese', '≥ 30', Colors.red),
        ],
      ),
    );
  }

  // Helper widget for scale items
  Widget _buildScaleItem(String label, String range, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(range),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your BMI Result'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[800]!, Colors.blue[50]!],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Result Card
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Icon(
                              Icons.health_and_safety,
                              size: 80,
                              color: _getCategoryColor(),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Your BMI is',
                              style: TextStyle(fontSize: 22),
                            ),
                            const SizedBox(height: 12),
                            // BMI Number
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: _getCategoryColor(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                bmiResult,
                                style: const TextStyle(
                                  fontSize: 64,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            // Category
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _getCategoryEmoji(),
                                  style: const TextStyle(fontSize: 24),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  category,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: _getCategoryColor(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // BMI Scale
                    _buildBMIScale(),
                  ],
                ),
              ),
            ),
            // Calculate Again Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const InputPage()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Calculate Again',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}