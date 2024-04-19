import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hayalgram/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:core';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  String _username = "";
  String _password = "";

  void _onUsernameChanged(String username) {
    setState(() {
      _username = username;
    });
  }

  void _onPasswordChanged(String password) {
    setState(() {
      _password = password;
    });
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      // Assuming you have _formKey for validation
      if (_username.toLowerCase() == "admin" &&
          _password.toLowerCase() == "admin") {
        // Proceed directly to the home page
        Navigator.pushReplacementNamed(context, '/home');
        return; // Exit the function early if admin credentials are used
      }

      // Attempt API login
      try {
        var url = Uri.parse('http://10.8.0.6:5002/login');
        var response = await http.post(url, body: {
          'email': _username,
          'password': _password,
        });

        if (response.statusCode == 200) {
          // Successful login - assuming API returns a token
          var decodedResponse = jsonDecode(response.body);
          String token = decodedResponse['token'];
          await storage.write(key: 'token', value: token);
          Navigator.pushReplacementNamed(context, '/home');
        } else if (response.statusCode == 401) {
          // Check for specific error code
          _showErrorDialog('Invalid Credentials');
        } else {
          // Other API errors
          _showErrorDialog('Login Error. Please try again.');
        }
      } catch (e) {
        _showErrorDialog('Connection Error. Please try again. Details: $e');
      }
    } else {
      _showErrorDialog('Invalid Credentials'); // Invalid form data
    }
  }

  void _showErrorDialog(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hayalgram"), // Use your app name
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 40.0),
              Image.asset(
                'images/hayalhanemlogo.png',
                height: 100,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Username/Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your username/email";
                  }
                  return null;
                },
                onChanged: _onUsernameChanged,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                onChanged: _onPasswordChanged,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text("Log In"),
              ),
              SizedBox(height: 20), // Spacing between buttons
              TextButton(
                onPressed: () {
                  // Handle navigation to Register page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text("Register"),
              ),
              TextButton(
                onPressed: () {
                  // Handle navigation to Password Reset page
                },
                child: Text("Forgot Your Password?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
