import 'package:flutter/material.dart';
import 'package:app_dev_workshop/screens/result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  String? selectedGender;
  double age = 25;

  // Simplified BMI calculation and navigation
  void _calculateBMI() {
    if (_formKey.currentState!.validate() && selectedGender != null) {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text) / 100;
      double bmi = weight / (height * height);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            bmiResult: bmi.toStringAsFixed(1),
            category: _getBMICategory(bmi),
          ),
        ),
      );
    } else {
      // Simplified error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and select gender')),
      );
    }
  }

  // Simple BMI category determination
  String _getBMICategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal Weight';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  // Simplified gender card with basic animation
  Widget _buildGenderCard(String gender, String assetPath) {
    bool isSelected = selectedGender == gender;
    
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(assetPath, height: 70, width: 70),
            const SizedBox(height: 16),
            Text(
              gender,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simplified input field
  Widget _buildInputField(TextEditingController controller, String label, String suffix) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'This field is required';
        if (double.tryParse(value) == null) return 'Please enter a valid number';
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[800]!, Colors.blue[50]!],
            stops: const [0.0, 0.2],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Tell us about yourself',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Gender Selection
                Row(
                  children: [
                    Expanded(child: _buildGenderCard('Male', 'assets/images/male.png')),
                    const SizedBox(width: 20),
                    Expanded(child: _buildGenderCard('Female', 'assets/images/female.png')),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // Age Slider
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Age: ${age.toInt()} years'),
                      Slider(
                        value: age,
                        min: 1,
                        max: 120,
                        onChanged: (value) => setState(() => age = value),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                _buildInputField(_weightController, 'Weight', 'kg'),
                const SizedBox(height: 20),
                _buildInputField(_heightController, 'Height', 'cm'),
                
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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