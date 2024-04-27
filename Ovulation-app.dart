// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences';

// Main function - starting point of the application
void main() {
  runApp(MyApp());
}

// App class - defines core app configuration
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ovulation tracker', // App title
      theme: ThemeData(
        primarySwatch: Colors.purple, // Set app theme (optional)
      ),
      home: HomePage(), // Set initial screen
    );
  }
}

// Home page state manages UI state and functionality
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _periodStartDate;
  String? _cervicalMucus;

  List<String> cervicalMucusOptions = ["Dry", "Sticky", "Watery", "Eggwhite"];

  // Function to update state with selected date
  void _selectPeriodStartDate(DateTime pickedDate) {
    setState(() {
      _periodStartDate = pickedDate;
    });
  }

  // Function to open date picker dialog
  Future<void> _datePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      _selectPeriodStartDate(pickedDate);
    }
  }
  // Function to save period data in Shared Preferences (async/await)
  Future<void>savePeriodData(DateTime periodStartDate) async{
     final sharedPefs = await SharedPreferences.getInstance();
      await sharedPefs.setString('periodStart',periodStartDate.toString());
  }

  // Function to retrieve period start date from Shared Preferences
  Future<String?> getPeriodStartDate() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("periodStart");
  }

  // Build function to render the UI
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("ovulation tracker"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Period Start Date",
              ),
              readOnly: true,
              onTap: () => _datePicker(context),
              // Use FutureBuilder to wait for data
              
              ),
            
            SizedBox(height: 15.0),
            DropdownButtonFormField(
              value: _cervicalMucus,
              hint: Text("Cervical Mucus"),
              items: cervicalMucusOptions.map((cervicalMucus) => DropdownMenuItem(
                value: cervicalMucus,
                child: Text(cervicalMucus),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  _cervicalMucus = value as String;
                });
              },
            ),
            SizedBox(height: 15.0),
            // Add more fields for Basal Body Temperature (if applicable)
            ElevatedButton(
              onPressed: () {
                if (_periodStartDate != null) {
                  // Save data only if a start date is selected
                  savePeriodData(_periodStartDate!);
                  // Display success message or navigate (optional)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Data Saved Successfully!"),
                    ),
                  );
                } else {
                  // Show error message if no start date is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please select a period start date"),
                    ),
                  );
                }
              },
              child: Text("Save Data"),
            ),
            // Add educational content section here (optional)
          ],
        ),
      ),
    );
  }
}

