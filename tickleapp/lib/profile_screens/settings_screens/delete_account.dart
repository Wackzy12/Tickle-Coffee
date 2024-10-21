import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tickleapp/main.dart';

class DeleteAccountScreen extends StatefulWidget {
  @override
  _DeleteAccountScreenState createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (_auth.currentUser != null) {
      emailController.text = _auth.currentUser!.email ?? '';
    }
  }

  Future<bool> reAuthenticateUser(String email, String password) async {
    User? user = _auth.currentUser;

    AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

    try {
      await user?.reauthenticateWithCredential(credential);
      return true; // Re-authentication successful
    } catch (e) {
      print("Re-authentication failed: $e");
      _showErrorDialog(context, 'Re-authentication failed. Please check your email and password.');
      return false; // Re-authentication failed
    }
  }

  Future<void> deleteUserAccount(BuildContext context) async {
    User? user = _auth.currentUser;

    if (user != null) {
      // Check if the entered email matches the current user's email
      if (emailController.text != user.email) {
        _showErrorDialog(context, 'The email does not match the current user.');
        return;
      }

      // Re-authenticate the user and check if successful
      bool isAuthenticated = await reAuthenticateUser(emailController.text, passwordController.text);
      if (!isAuthenticated) {
        return; // Exit if re-authentication failed
      }

      try {
        // Delete the user's data from Firestore
        await _firestore.collection('Users').doc(user.uid).delete();
        // Delete the user account
        await user.delete();

        // Show success dialog and navigate after it's dismissed
        _showSuccessDialog(context, 'Account deleted successfully');
      } catch (e) {
        _showErrorDialog(context, e.toString());
      }
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Error',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF112e12),
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Try Again',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Success',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate to LoadingScreen after the dialog is dismissed
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoadingScreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF112e12),
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Okay',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Delete Account',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Delete Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF112e12),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'This action is irreversible and will permanently delete your account and all associated data.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => deleteUserAccount(context),
                child: Text('Delete My Account'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 40),
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF112e12),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  foregroundColor: Color(0xFF112e12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}