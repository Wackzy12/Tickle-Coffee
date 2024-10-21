import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tickleapp/auth_screens/auth_service.dart';
import 'package:tickleapp/profile_screens/about_app.dart';
import 'package:tickleapp/profile_screens/account_info.dart';
import 'package:tickleapp/profile_screens/payment_method.dart';
import 'package:tickleapp/profile_screens/privacy_policy.dart';
import 'package:tickleapp/profile_screens/settings.dart';
import 'package:tickleapp/profile_screens/terms_conditions.dart';
import 'package:tickleapp/main.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();
  String firstName = '';
  String lastName = '';
  String email = '';
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await _firestore.collection('Users').doc(user.uid).get();

        if (userDoc.exists) {
          setState(() {
            firstName = userDoc['first name'] ?? 'No First Name';
            lastName = userDoc['last name'] ?? 'No Last Name';
            email = user.email ?? 'No Email';
            imageUrl = userDoc['imageUrl'] ?? '';
          });
        } else {
          throw Exception('User document not found');
        }
      } else {
        throw Exception('No user is currently logged in');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> uploadImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    log('${file?.path}');

    if (file == null) return;

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();

      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore
            .collection('Users')
            .doc(user.uid)
            .update({'imageUrl': imageUrl});
        setState(() {});
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: imageUrl.isNotEmpty
                          ? NetworkImage(imageUrl)
                          : NetworkImage('https://www.pngkey.com/png/detail/115-1150152_default-profile-picture-avatar-png-green.png'),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: uploadImage,
                        icon: Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  firstName.isNotEmpty || lastName.isNotEmpty
                      ? '$firstName $lastName'
                      : 'Loading...',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  email.isNotEmpty ? email : 'Loading...',
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
                ListTile(
                  leading: Icon(Icons.account_circle, color: Color(0xFF112e12)),
                  title: Text('Account Information'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountInformationScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Color(0xFF112e12)),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(),
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
                  onTap: () async {
                    await _authService.signout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoadingScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}