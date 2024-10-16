import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickleapp/auth_screens/login_screen.dart';

class ForgotPassword extends StatefulWidget{
  const ForgotPassword({Key, key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.setLanguageCode('en');

      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _email.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset email sent! Check your inbox.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF112e12),
                    foregroundColor: Colors.white
                ),
                child: Text('Back to log in',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text('Invalid email. Please try again',
              textAlign: TextAlign.center),
        );
      });
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF112e12),
        title: Text('Reset Password', style: TextStyle(fontSize: 24, color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Please enter the email address you used to register your Tickle Coffee account.\nWe'll send you an email with a link to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
            SizedBox(height: 30),
            SizedBox(
              width: 350,
              height: 40,
              child: MaterialButton(
                onPressed: passwordReset,
                child: Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xFF112e12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}