import 'dart:convert';
import 'package:chat_application/model/login_response.dart';
import 'package:chat_application/model/otp_response.dart';
import 'package:chat_application/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../model/success_response.dart';

class ApiService {
  Future<User> logInApi({
    required String personalInfo,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.137:3000/users/login"),
        body: {
          "personal_info": personalInfo,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }  else if (response.statusCode == 400) {
        Map<String,dynamic> msgData=jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: msgData["message"],
          toastLength: Toast.LENGTH_SHORT,
        );
        return User();
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<SuccessResponse> signUpApi({
    required String userName,
    required String fullName,
    required String? countryCode,
    required String? phoneNumber,
    required String? email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.137:3000/users/signup"),
        body: {
          "user_name": userName.toString(),
          "full_name": fullName,
          "country_code": countryCode,
          "phone_number": phoneNumber,
          "email": email,
          "password": password
        },
      );
      if (response.statusCode == 200) {
        print("response----${response.body}");
        return SuccessResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print("Sign up api function catch error ${e}");
      //final errorMessage = e.response!.data['message'];
      throw Exception('An error occurred: $e');
    }
  }

  Future<OtpVerification> verifyOtp({
    required String email,
    required String otp,
    required BuildContext context,
  }) async {
    try {
      final uri = Uri.parse("http://192.168.1.137:3000/users/verify-otp");

      final response = await http.put(
        uri,
        body: {
          "email": email.toString(),
          "otp": otp,
        },
      );

      if (response.statusCode == 200) {
        print('Data updated successfully: ${response.body}');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else if (response.statusCode == 400) {
        print('Bad Request. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        Fluttertoast.showToast(
          msg: "Invalid OTP or Request. Please try again.",
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        print('Failed to update data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        Fluttertoast.showToast(
          msg: "Failed to update data. Please try again later.",
          toastLength: Toast.LENGTH_SHORT,
        );
      }

      return OtpVerification.fromJson(jsonDecode(response.body));
    } catch (e) {
      print('Error updating data: $e');
      Fluttertoast.showToast(
        msg: "An error occurred: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
      );
      throw Exception('Failed to post data');
    }
  }

}
