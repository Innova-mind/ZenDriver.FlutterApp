import 'package:flutter/material.dart';
import 'package:zendriver/ui/pages/signup_screen.dart';
import 'package:zendriver/ui/shared/base.dart';

import '../../login/authenticate.dart';
import '../../login/http_helper.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  HttpHelper httpHelper = HttpHelper();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  void navigateToHome(LoginResponse response) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Base(token: response.token)));
  }

  void navigateToSignup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  void signIn() async {
    try {
      LoginResponse? response = await httpHelper.login(
          _usernameController.text, _passwordController.text);
      navigateToHome(response);
    } catch (e) {
      String message = e.toString().split(':')[1].trim();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      onChanged: _validateForm,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'User Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your user name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _isButtonEnabled ? signIn: null,
            child: const Text('Sign In'),
          ),
          ElevatedButton(
            onPressed: navigateToSignup,
            child: const Text('Sign Up'),
          ),
        ],
      ),
    ));
  }
}