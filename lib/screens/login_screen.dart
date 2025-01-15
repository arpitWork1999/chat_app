import 'package:chat_application/providers/auth_provider.dart';
import 'package:chat_application/screens/forgot_password_screen.dart';
import 'package:chat_application/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../apiService/api_service.dart';
import '../providers/shared_prefrences_provider.dart';
import '../utilities/shared_preference.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  ApiService apiService = ApiService();

  Future<void> logIn() async {
    if (formKey.currentState!.validate()) {
      try{
        final response = await apiService.logInApi(
            personalInfo: _emailController.text.trim(),
            password: _passController.text.trim())
            .then((v) async {
          if (v.statusCode == 200) {
            //Fluttertoast.showToast(msg: v.message.toString());
            await UserPreferences().saveUser(v);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
          else{
            Fluttertoast.showToast(msg: "Invalid credentials!");
          }
        });
      }catch(e){
        //print("ERROR====>$e");
        Fluttertoast.showToast(msg: "An error occurred: $e");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final prefService = Provider.of<SharedPrefrencesService>(context);

    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Log In",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Email",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^(?!.*\s)[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(?!.*\s)")
                                .hasMatch(value)) {
                          if (value == '') {
                            return "Your username is required";
                          } else {
                            return "Please provide a valid email address";
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passController,
                      obscureText: !authProvider.isObscured,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: (){
                                authProvider.passwordVisibility();
                              },
                              icon: Icon(authProvider.isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          labelText: "Password",
                          border: const OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPasswordScreen()));
                          },
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: ElevatedButton(
                          onPressed: logIn,
                          // onPressed: () async {
                          //   try {
                          //     await authProvider.signin(
                          //         _emailController.text, _passController.text);
                          //     Fluttertoast.showToast(msg: "Login Success");
                          //
                          //     Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => HomeScreen()));
                          //   } catch (e) {
                          //     print(e);
                          //   }
                          // },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white),
                          child: const Text(
                            "Log In",
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
