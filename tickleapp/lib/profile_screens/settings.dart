import 'package:flutter/material.dart';
import 'package:tickleapp/profile_screens/settings_screens/change_password.dart';
import 'package:tickleapp/profile_screens/settings_screens/delete_account.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Settings',
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.lock, color: Color(0xFF112e12)),
            title: Text(
              'Change Password',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
              );

            },
          ),
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.delete, color: Color(0xFF112e12)),
            title: Text(
              'Delete Account',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeleteAccountScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}