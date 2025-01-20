import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider extends ChangeNotifier {
  String _countryCode = '+91';
  bool _isObscured = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool get isObscured => _isObscured;

  void setLoading( bool value){
    _isLoading = value;
    notifyListeners();
  }

  void passwordVisibility(){
    _isObscured = !_isObscured;
    notifyListeners();
  }

  String get countryCode => _countryCode;

  set name(String newCountryCode) {
    _countryCode = newCountryCode;
    notifyListeners();
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // User? get currentUser => _auth.currentUser;
    // bool get isSignedIn => currentUser != null;

    // Future<void> signin(String email, String password) async {
    //   await _auth.signInWithEmailAndPassword(email: email, password: password);
    //   notifyListeners();
    // }

    // Future<void> signup(String email, String password, String name, String imageUrl) async {
    //   UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
    //       email: email, password: password);
    //   await _firestore.collection('users').doc(userCredential.user!.uid).set({
    //     'uid': userCredential.user!.uid,
    //     'name': name,
    //     'email': email,
    //     'imageUrl': imageUrl,
    //   });
    //   notifyListeners();
    // }

    // Future<void> signOut() async{
    //   await _auth.signOut();
    //   notifyListeners();
    // }
  }
}
