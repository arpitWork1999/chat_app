import 'package:shared_preferences/shared_preferences.dart';
import '../model/login_response.dart';

class UserPreferences{
  Future saveUser(User user)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("userName", user.data!.userName??"");
    prefs.setString("fullName", user.data!.fullName.toString());
    prefs.setString("countryCode", user.data!.countryCode.toString());
    prefs.setString("phoneNumber", user.data!.phoneNumber.toString());
    prefs.setString("email", user.data!.email.toString());
    prefs.setString("password", user.data!.password.toString());
    prefs.setBool('isLoggedIn', true);

  }
}