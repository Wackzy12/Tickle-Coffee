import 'package:flutter/material.dart';

// Placeholder screens for navigation
class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: Center(child: Text('Change Password Screen')),
    );
  }
}

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Language Settings')),
      body: Center(child: Text('Language Screen')),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Settings')),
      body: Center(child: Text('Account Settings Screen')),
    );
  }
}

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Method')),
      body: Center(child: Text('Payment Method Screen')),
    );
  }
}

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About App')),
      body: Center(child: Text('About App Screen')),
    );
  }
}

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms & Conditions')),
      body: Center(child: Text('Terms & Conditions Screen')),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy Policy')),
      body: Center(child: Text('Privacy Policy Screen')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF112e12),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://www.reallygreatsite.com/your_profile_image.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Robby Dizon',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'dcrdizon@student.hau.edu.ph',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // General Settings Section
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock, color: Color(0xFF112e12)),
                    title: Text('Change Password'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.payment, color: Color(0xFF112e12)),
                    title: Text('Payment Method'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentMethodScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Information Section
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Color(0xFF112e12)),
                    title: Text('About App'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutAppScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description, color: Color(0xFF112e12)),
                    title: Text('Terms & Conditions'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsAndConditionsScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip, color: Color(0xFF112e12)),
                    title: Text('Privacy Policy'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen(),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.logout, color: Color(0xFF112e12)),
                    title: Text('Log Out'),
                    onTap: () {
                      // Placeholder for logout
                      print('Log Out tapped');
                      Navigator.pop(context); // Example of popping the current route
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

