import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create a global key for the form
  final _formKey = GlobalKey<FormState>();

  // Create controllers for the email and password fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Create a method to validate and submit the form
  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState !.validate()) {
      // Get the email and password values from the controllers
      String email = _emailController.text;
      String password = _passwordController.text;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

      // TODO: Perform your login logic here

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Email field with validation
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (value.contains(' ')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              // Password field with validation and obscure text
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              // Login button that calls the submit method
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}