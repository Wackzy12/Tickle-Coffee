import 'package:flutter/material.dart';
import 'AboutApp_screen.dart';
import 'TermsAndConditions_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF112e12),
        automaticallyImplyLeading: false,
      )     ,
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
                    leading: Icon(Icons.brightness_6, color: Color(0xFF112e12)),
                    title: Text('Mode'),
                    subtitle: Text('Dark & Light'),
                    trailing: Switch(
                      value: true,
                      onChanged: (bool newValue) {
                        // Handle mode change here
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock, color: Color(0xFF112e12)),
                    title: Text('Change Password'),

                    onTap: () {
                      // Navigate to Change Password screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language, color: Color(0xFF112e12)),
                    title: Text('Language'),

                    onTap: () {
                      // Navigate to Language screen
                    },
                  ),
                  ListTile(
                      leading: Icon(Icons.settings, color: Color(0xFF112e12)),
                      title: Text('Account Settings'),

                      onTap: () {
                        // Navigate to Language screen
                      }
                  ),
                  ListTile(
                      leading: Icon(Icons.payment, color: Color(0xFF112e12)),
                      title: Text('Payment Method'),

                      onTap: () {

                      }
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
                      color: Colors.black, // Change text color
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Color(0xFF112e12)),
                    title: Text('About App'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutAppScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description, color: Color(0xFF112e12)),
                    title: Text('Terms & Conditions'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip, color: Color(0xFF112e12)),
                    title: Text('Privacy Policy'),

                    onTap: () {
                      // Navigate to Privacy Policy screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share, color: Color(0xFF112e12)),
                    title: Text('Share This App'),

                    onTap: () {
                      // Handle app sharing
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Color(0xFF112e12)),
                    title: Text('Log Out'),
                    onTap: () {

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
