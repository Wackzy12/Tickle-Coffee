import 'package:flutter/material.dart';

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
                    leading: Icon(Icons.lock, color: Color(0xFF112e12)),
                    title: Text('Change Password'),

                    onTap: () {
                      // Navigate to Change Password screen
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
                      // Navigate to About App screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description, color: Color(0xFF112e12)),
                    title: Text('Terms & Conditions'),

                    onTap: () {
                      // Navigate to Terms & Conditions screen
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
