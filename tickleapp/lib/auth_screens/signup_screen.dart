import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickleapp/auth_screens/auth_service.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<SignUpScreen> {
  final _auth = AuthService();

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _phone = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _phone.dispose();
  }

  Future<bool> signUp() async {
    if (_firstName.text.isEmpty ||
        _lastName.text.isEmpty ||
        _email.text.isEmpty ||
        _password.text.isEmpty ||
        _confirmPassword.text.isEmpty ||
        _phone.text.isEmpty) {
      _showErrorDialog('Please fill in all fields');
      return false;
    }

    if (_phone.text.trim().length != 10) {
      _showErrorDialog('Invalid phone number');
      return false;
    }

    if (!passwordConfirmed()) {
      _showErrorDialog('Passwords do not match');
      return false;
    }

    try {

      String? uid = await _auth.createUserWithEmailandPassword(
        _email.text.trim(),
        _password.text.trim(),
      );


      if (uid != null) {
        await addUserDetails(uid,
          _firstName.text.trim(),
          _lastName.text.trim(),
          _email.text.trim(),
          _phone.text.trim(),
        );
        return true;
      }else {
        _showErrorDialog('Failed to create user.');
        return false;
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showErrorDialog('This email already exists.');
      } else if (e.code == 'invalid-email') {
        _showErrorDialog('Invalid email format.');
      } else {
        _showErrorDialog('Error during sign up: ${e.message}');
      }
      return false;
    } catch (e) {
      _showErrorDialog('Error during sign up: $e');
      return false;
    }
  }

  Future<void> addUserDetails(String uid, String firstName, String lastName, String email, String phone) async {
    await FirebaseFirestore.instance.collection('Users').doc(uid).set({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'phone': phone,
    });
  }

  bool passwordConfirmed() {
    return _password.text.trim() == _confirmPassword.text.trim();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Sign Up Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Okay'),
          )
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF112e12),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ready to sign up to TICKLE?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'Tell us more about you so we can give you the best services we have.',
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(right: 250.0),
              alignment: Alignment.center,
              child: Text(
                'User Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
                controller: _firstName,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Color(0xFF112e12),
                      width: 2,
                    ),
                  ),
                  hintText: 'First Name',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
                controller: _lastName,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Color(0xFF112e12),
                      width: 2,
                    ),
                  ),
                  hintText: 'Last Name',
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(right: 170.0),
              alignment: Alignment.center,
              child: Text(
                'Login & Contact Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Color(0xFF112e12),
                      width: 2,
                    ),
                  ),
                  hintText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Color(0xFF112e12),
                      width: 2,
                    ),
                  ),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
                controller: _confirmPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Color(0xFF112e12),
                      width: 2,
                    ),
                  ),
                  hintText: 'Confirm Password',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                      '+63',
                      style: TextStyle(
                        color: Colors.black, // Adjust color as needed
                        fontSize: 16,
                      ),
                    ),
                  ),
                  hintText: '9xxxxxxxxx',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Color(0xFF112e12),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: ()async {
                bool success = await signUp();
                if (success){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 40),
                  backgroundColor: Color(0xFF112e12),
                  foregroundColor: Colors.white
              ),
              child: Text('Create your account'),
            )
          ],
        ),
      ),
    );
  }
}