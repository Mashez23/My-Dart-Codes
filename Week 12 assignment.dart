import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'), // Replace with your logo path
      ),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) => setState(() => email = value),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) => setState(() => password = value),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement login logic (e.g., validate credentials)
                if (isValidLogin(email, password)) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  bool isValidLogin(String email, String password) {
    // Implement your validation logic here
    // Replace with actual validation
    return email.isNotEmpty && password.isNotEmpty;
  }
}
class HomePage extends StatelessWidget {
  final List<String> items = ['Item 1', 'Item 2', 'Item 3']; // Replace with your list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              // Handle item selection (e.g., show details)
            },
          );
        },
      ),
    );
  }
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

