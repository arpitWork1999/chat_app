import 'dart:convert';
import 'package:chat_application/model/login_response.dart';
import 'package:chat_application/model/otp_response.dart';
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
      print("Response===>${response.body}");
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print(e);
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
      print(e);
      throw Exception('An error occurred: $e');
    }
  }

  Future<OtpVerification> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final uri = Uri.parse("http://192.168.1.137:3000/users/verify-otp");

      final response = await http.put(
        uri,
        body: {
          "email": email.toString(),
          "otp": otp
        }
      );

      if (response.statusCode == 200) {
        print('Data updated successfully: ${response.body}');
      } else {
        print('Failed to update data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        throw Exception('Failed to post data');
      }
      return OtpVerification.fromJson(jsonDecode(response.body));
    } catch (e) {
      print('Error updating data: $e');
      throw Exception('Failed to post data');
    }
  }
}
