import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // instance of Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign user in
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //add new document for the user in the users collection if it does not already exits!
      _firestore.collection('users').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
        SetOptions(
          merge: true,
        ),
      );

      return userCredential;
    }
    // catch any errors
    on FirebaseAuthException catch (error) {
      /*if (error.code == 'user-not-found') {
        print('No user found for that email!');
      } else if (error.code == 'wrong-password') {
        print('Wrong password provided for that user!');
      }*/

      throw Exception(error.code);
    }
  }

  // create new user
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //create new document for the user in the users collection
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    }
    // catch errors while creating new user
    on FirebaseAuthException catch (error) {
      /*if (error.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }*/

      throw Exception(error.code);
    }
  }

  // sign user out
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
