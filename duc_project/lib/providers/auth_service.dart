import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Register user
  Future registerUser(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
}
