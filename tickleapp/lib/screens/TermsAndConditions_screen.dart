import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '1. Acceptance of Terms\n\n'
                    'By using this app, you agree to the following terms and conditions. '
                    'If you do not agree with these terms, please do not use the app.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '2. User Responsibilities\n\n'
                    'You are responsible for any activity that occurs under your account. '
                    'You agree not to misuse the app or help anyone else to do so.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '3. Limitation of Liability\n\n'
                    'The developers are not liable for any damages that may arise from the use of this app.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '4. Changes to Terms\n\n'
                    'We reserve the right to modify these terms at any time. '
                    'Your continued use of the app signifies your acceptance of the updated terms.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}