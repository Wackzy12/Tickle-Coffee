
import 'package:firebase_auth/firebase_auth.dart';
class AuthService{
  final _auth = FirebaseAuth.instance;

  Future<String?> createUserWithEmailandPassword(String email, String password) async{
    try{
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user?.uid;
    }catch(e){
      print("Something went wrong");
    }
    return null;
  }
  Future<String?> logInWithEmailandPassword(String email, String password) async{
    try{
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cred.user?.uid;
    }catch(e){
      print("Something went wrong");
    }
    return null;
  }


  Future<void> signout() async{
    try{
      _auth.signOut();
    }catch (e){
      print("Something went wrong, error: e");
    }
  }
}