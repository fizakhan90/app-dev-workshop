// screens/input_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightFeetController = TextEditingController();
  final _heightInchesController = TextEditingController();
  final _heightCmController = TextEditingController();

  
  String _selectedGender = 'Male';
  String _weightUnit = 'kg';
  String _heightUnit = 'cm';
  int _age = 25;

  
  double _calculateBMI() {
    double weightInKg = _weightUnit == 'kg'
        ? double.parse(_weightController.text)
        : double.parse(_weightController.text) * 0.453592;

    double heightInMeters;
    if (_heightUnit == 'cm') {
      heightInMeters = double.parse(_heightCmController.text) / 100;
    } else {
      double feet = double.parse(_heightFeetController.text);
      double inches = double.parse(_heightInchesController.text);
      double totalInches = (feet * 12) + inches;
      heightInMeters = totalInches * 0.0254;
    }

    return weightInKg / (heightInMeters * heightInMeters);
  }

  String _getBMICategory(double bmi) {
    if (bmi < 16) return 'Severe Underweight';
    if (bmi < 17) return 'Moderate Underweight';
    if (bmi < 18.5) return 'Mild Underweight';
    if (bmi < 25) return 'Normal Weight';
    if (bmi < 30) return 'Overweight';
    if (bmi < 35) return 'Obesity Class I';
    if (bmi < 40) return 'Obesity Class II';
    return 'Obesity Class III';
  }

  String _getHealthRisk(double bmi) {
    if (bmi < 18.5) return 'Risk of nutritional deficiency and osteoporosis';
    if (bmi < 25) return 'Low risk of health problems';
    if (bmi < 30) return 'Moderate risk of heart disease and diabetes';
    if (bmi < 35) return 'High risk of heart disease and diabetes';
    return 'Very high risk of heart disease and diabetes';
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      double bmi = _calculateBMI();
      String category = _getBMICategory(bmi);
      String healthRisk = _getHealthRisk(bmi);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            bmiResult: bmi.toStringAsFixed(1),
            category: category,
            healthRisk: healthRisk,
            age: _age,
            gender: _selectedGender,
          ),
        ),
      );
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
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Text(
                  'Enter Your Details',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),

      
                Row(
                  children: [
                    Expanded(
                      child: _buildGenderCard('Male'),
                    ),
                    Expanded(
                      child: _buildGenderCard('Female'),
                    ),
                  ],
                ),

                SizedBox(height: 24),

          
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Weight',
                          labelStyle: TextStyle(color: Colors.white70),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter weight';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _weightUnit,
                        dropdownColor: Color(0xFF6A5ACD),
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white70),
                        ),
                        items: ['kg', 'lbs']
                            .map((unit) => DropdownMenuItem(
                                  value: unit,
                                  child: Text(unit),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() => _weightUnit = value!);
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

            
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _heightUnit,
                        dropdownColor: Color(0xFF6A5ACD),
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Height Unit',
                          labelStyle: TextStyle(color: Colors.white70),
                        ),
                        items: ['cm', 'ft']
                            .map((unit) => DropdownMenuItem(
                                  value: unit,
                                  child: Text(unit),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() => _heightUnit = value!);
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                if (_heightUnit == 'cm')
                  TextFormField(
                    controller: _heightCmController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                      labelStyle: TextStyle(color: Colors.white70),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter height';
                      }
                      return null;
                    },
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _heightFeetController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Feet',
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _heightInchesController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Inches',
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: 24),

          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age: $_age',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(width: 16),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () => setState(() => _age--),
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 8),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () => setState(() => _age++),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),

                SizedBox(height: 32),

                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'CALCULATE BMI',
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

  Widget _buildGenderCard(String gender) {
  bool isSelected = _selectedGender == gender;
  return GestureDetector(
    onTap: () => setState(() => _selectedGender = gender),
    child: Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white12 : Colors.white10,
        borderRadius: BorderRadius.circular(15),
        border: isSelected
            ? Border.all(color: Colors.white, width: 2)
            : Border.all(color: Colors.transparent),
      ),
      child: Column(
        children: [
          Image.asset(
            gender == 'Male' ? 'assets/images/male.png' : 'assets/images/female.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover, // Adjust this to fit the image well
          ),
          SizedBox(height: 8),
          Text(
            gender,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
}