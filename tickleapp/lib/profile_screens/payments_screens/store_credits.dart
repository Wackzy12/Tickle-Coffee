import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tickleapp/navigator.dart';

class AddCreditsScreen extends StatefulWidget {
  @override
  _AddCreditsScreenState createState() => _AddCreditsScreenState();
}

class _AddCreditsScreenState extends State<AddCreditsScreen> {
  final TextEditingController _creditsController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;  // FirebaseAuth instance
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  // Fetch the current logged-in user
  void _getCurrentUser() {
    _currentUser = _auth.currentUser;
    if (_currentUser == null) {
      // Handle user not being logged in (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No user logged in!')),
      );
    }
  }

  // Function to add credits to Firestore
  Future<void> _addCredits() async {
    if (_currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No user logged in!')),
      );
      return;
    }

    if (_creditsController.text.isNotEmpty) {
      try {
        // Change from int to double
        double credits = double.parse(_creditsController.text);

        // Updating the user's credits field in the Users collection
        await _firestore.collection('Users').doc(_currentUser!.uid).set({
          'credits': FieldValue.increment(credits),
        }, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Credits added successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add credits: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid credits')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Tickle Credits',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _creditsController,
              keyboardType: TextInputType.number,
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
                hintText: 'Enter Credits',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _addCredits();
                // Navigate to the main navigator after adding credits
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainNavigator()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 40),
                backgroundColor: Color(0xFF112e12),
                foregroundColor: Colors.white,
              ),
              child: Text('Add Credits'),
            ),
          ],
        ),
      ),
    );
  }
}