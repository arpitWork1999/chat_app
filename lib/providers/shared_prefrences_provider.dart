import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesService extends ChangeNotifier{
  String _userName = " ";
  String _fullName = " ";
  String _countryCode = " ";
  String _phoneNumber = " ";
  String _email = " ";
  String _password = " ";

  String get userName => _userName;

  String get fullName => _fullName;

  String get countryCode => _countryCode;

  String get phoneNumber => _phoneNumber;

  String get email => _email;

  String get password => _password;

  Future<void> loadPrefrences()async{
    final prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString("userName")??" ";
    _fullName = prefs.getString("fullName")??" ";
    _countryCode = prefs.getString("countryCode")??" ";
    _phoneNumber = prefs.getString("phoneNumber")??" ";
    _email = prefs.getString("email")??" ";
    _password = prefs.getString("password")??" ";

    notifyListeners();
  }
}