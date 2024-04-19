import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Variables to store form data
  String _email = "";
  String _username = "";
  String _fullName = "";
  String _password = "";
  String _confirmPassword = "";

  // ... (Functions for handling input changes similar to your login.dart)

  void _handleRegistration() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement registration logic
      // 1. Validate passwords match
      // 2. Send registration data to your backend
      // 3. Handle success/errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Account"),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40.0),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  // ... (Add validator)
                  onChanged: (value) => _email = value,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: "Full Name"),
                  // ... (Add validator)
                  onChanged: (value) => _fullName = value,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: "Username"),
                  // ... (Add validator)
                  onChanged: (value) => _username = value,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  // ... (Add validator)
                  onChanged: (value) => _password = value,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(labelText: "Confirm Password"),
                  obscureText: true,
                  // ... (Add validator)
                  onChanged: (value) => _confirmPassword = value,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _handleRegistration,
                  child: Text("Sign Up"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
