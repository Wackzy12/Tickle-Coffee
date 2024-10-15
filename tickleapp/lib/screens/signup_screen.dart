import 'package:flutter/material.dart';
import 'package:tickleapp/screens/auth_service.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<SignUpScreen> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign up',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ready to sign up to TICKLE?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'Tell us more about you so we can give you the best services we have.',
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(right: 250.0),
              alignment: Alignment.center,
              child: Text(
                'User Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
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
                  hintText: 'First Name',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
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
                  hintText: 'Last Name',
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(right: 170.0),
              alignment: Alignment.center,
              child: Text(
                'Login & Contact Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 10),
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
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
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
                  hintText: 'Confirm Password',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350, height: 40,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                      '+63',
                      style: TextStyle(
                        color: Colors.black, // Adjust color as needed
                        fontSize: 16,
                      ),
                    ),
                  ),
                  hintText: '9xxxxxxxxx',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Color(0xFF112e12),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: ()async {
                await _signup();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 40),
                  backgroundColor: Color(0xFF112e12),
                  foregroundColor: Colors.white
              ),
              child: Text('Create your account'),
            )
          ],
        ),
      ),
    );
  }
  _signup() async{
    final user = await _auth.createUserWithEmailandPassword(_email.text, _password.text);
    if(user != null) {
      print('User Created Successfully');
    }
  }
}