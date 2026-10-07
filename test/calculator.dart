import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),

      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _bmiResult;
  double? _bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI App")),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        width: double.maxFinite,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                "calculate your Bmi",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _weightController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
          
                decoration: InputDecoration(
                  labelText: "Weight",
                  hintText: "Enter your weight in kg",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                controller: _weightController,
                decoration: InputDecoration(
                  labelText: "Weight",
                  hintText: "Enter your weight in kg",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                controller: _heightController,
                decoration: InputDecoration(
                  labelText: "Height",
                  hintText: "Enter your height in cm",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: (FilledButton(
                  onPressed: () {
                    // tryparse menas if unbale to parse then return 0
                    double weight = double.tryParse(_weightController.text) ?? 0;
                    double height = double.tryParse(_heightController.text) ?? 0;
          
                    if (weight == 0 || height == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Bruh what are you doing Bro"),
                        ),
                      );
                    }
                    if (weight > 0 && height > 0) {
                      setState(() {
                        _bmi = weight / ((height / 100) * (height / 100));
                      });
                    } else {
                      setState(() {
                        _bmi = null;
                      });
                    }
                    if (_bmi != null) {
                      _bmiResult = _bmi! < 18.5
                          ? "Underweight"
                          : _bmi! < 25
                          ? "Normal weight"
                          : _bmi! < 30
                          ? "Overweight"
                          : "Obesity";
                    }
                  },
                  child: const Text("Calculate"),
                )),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    _bmi = 0;
                    _bmiResult = "";
                    _weightController.text = "";
                    _heightController.text = "";
                  },
                  child: Text("clear"),
                ),
              ),
              Text(
                "Your BMI is $_bmi",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
              Text(
                "You  are $_bmiResult",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
              // FilledButton(
              //   onPressed: () {
              //     // Calculate BMI logic here
              //   },
              //   child: const Text("Calculate"),
              // ) ,
              // ElevatedButton(onPressed: () {}, child: const Text("calculate"))
            ],
          ),
        ),
      ),
    );
  }
}
