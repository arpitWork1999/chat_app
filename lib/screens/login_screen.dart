import 'package:chat_application/providers/auth_provider.dart';
import 'package:chat_application/screens/home_screen.dart';
import 'package:chat_application/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  String? _username, _password;

  void logIn(){
    if(formKey.currentState!.validate()){
      print("Logged In");
    }
    else{
      Fluttertoast.showToast(msg: "Log In Failed!");
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("data"),
      // ),
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
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                        labelText: "Email", border: OutlineInputBorder()),
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
                    onSaved: (value)=>_username,

                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return "Please Enter Email";
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                        labelText: "Password", border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    onSaved: (value)=> _password,
                  ),
                  const SizedBox(
                    height: 30,
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
                  SizedBox(
                    height: 20,
                  ),
                  Text("OR"),
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
