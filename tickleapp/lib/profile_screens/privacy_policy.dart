import 'package:flutter/material.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Effective Date: October 15, 2024",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "1. Introduction",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We respect your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our app.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "2. Information We Collect",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We may collect the following types of information when you use our app:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "- Personal Data: Name, email address, and other identifying information.\n"
                    "- Usage Data: Information about how you interact with our app (e.g., features used, time spent).\n"
                    "- Device Information: Type of device, operating system, and app performance metrics.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "3. How We Use Your Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We may use the information we collect from you in the following ways:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "- To personalize your experience and provide tailored content.\n"
                    "- To improve our app and respond to customer service requests.\n"
                    "- To communicate with you about updates, offers, or changes to the service.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "4. Sharing Your Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We do not share your personal information with third parties except in the following circumstances:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "- With service providers to help us operate the app.\n"
                    "- If required by law or to protect our legal rights.\n"
                    "- In the event of a merger, acquisition, or sale of assets, your data may be transferred.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "5. Data Security",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We implement reasonable security measures to protect your data. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee its absolute security.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "6. Your Rights",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "You have the right to access, update, or delete your personal information. To exercise these rights, please contact us at support@yourapp.com.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "7. Changes to This Policy",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We may update this Privacy Policy from time to time. We encourage you to review this policy periodically for any changes.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "8. Contact Us",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions about this Privacy Policy, please contact us at support@yourapp.com.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}