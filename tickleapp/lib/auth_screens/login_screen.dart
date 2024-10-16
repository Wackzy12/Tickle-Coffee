import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickleapp/navigator.dart';
import 'package:tickleapp/auth_screens/auth_service.dart';
import '../screens/home_screen.dart';
import 'forgot_password.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> {

  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }
  

  Future<bool> logIn() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showErrorDialog('Please fill in all fields');
      return false;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text.trim(), password: _password.text.trim());
      return true;
    } on FirebaseAuthException catch (e) {
        _showErrorDialog('You need to input the correct email address or password to proceed. Please try again or reset your password by selecting "forgot password" in the next screen');
    } catch (e) {
      _showErrorDialog('An error occurred. Please try again.');
    }

    return false;
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Uh-oh the email or password is incorrect',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF112e12),
                foregroundColor: Colors.white
              ),
              child: Text('Try Again',
              style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Log in',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/logo.png'),
            SizedBox(height: 20),
            SizedBox(
              width: 350, height: 40,
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
            SizedBox(height: 20),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
                controller: _password,
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
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 200.0),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await logIn();
                if (success){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainNavigator()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 40),
                  backgroundColor: Color(0xFF112e12),
                  foregroundColor: Colors.white
              ),
              child: Text('Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
