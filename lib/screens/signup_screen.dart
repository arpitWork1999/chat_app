import 'package:chat_application/providers/auth_provider.dart';
import 'package:chat_application/screens/login_screen.dart';
import 'package:chat_application/screens/otp_screen.dart';
import 'package:chat_application/service/firebase_service/firebase.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../providers/shared_prefrences_provider.dart';
import '../service/api_service/api_service.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  
  ApiService apiService = ApiService();
  DatabaseMethods databaseMethods = DatabaseMethods();

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      if (_passController.text == _confirmPassController.text) {
        print("Saved");
        final provider = Provider.of<AuthProvider>(context, listen: false);
        await apiService
            .signUpApi(
                userName: _firstNameController.text.trim(),
                fullName:
                    "${_firstNameController.text} ${_lastNameController.text.trim()}",
                countryCode: provider.countryCode,
                phoneNumber: _phoneNumberController.text.trim(),
                email: _emailController.text.trim(),
                password: _passController.text.trim())
            .then((v) {
          if (v.statusCode == 200) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => OtpScreen(email: _emailController.text.trim(),)));
          }
        })
            .catchError((error) {
              print("error$error");
        })
        ;
      } else {
         print("object");
      }
    } else {
      Fluttertoast.showToast(msg: "Sign Up Failed!");
    }
  }
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Future<void> _signUp() async{
  //   try{
  //     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  //         email: _emailController.text, password: _passController.text);
  //     await _firestore.collection('users').doc(userCredential.user!.uid).set({
  //       'uid': userCredential.user!.uid,
  //       'name': _nameController.text,
  //       'email': _emailController.text,
  //       //'imageUrl': imageUrl,
  //     });
  //     Fluttertoast.showToast(msg: "Sign Up Success");
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
  //   }
  //   catch(e){
  //    print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final prefService = Provider.of<SharedPrefrencesService>(context);

    final authProvider = Provider.of<AuthProvider>(context);
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      "Create Account",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: " First Name",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter FirstName";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Last Name",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter LastName";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          prefixIcon: Consumer<AuthProvider>(
                            builder: (context, user, _) => CountryCodePicker(
                              onChanged: (countryCode) {
                                user.name = countryCode.dialCode!;
                                print("code====>${user.countryCode}");
                              },
                              initialSelection: user.countryCode,
                              favorite: ['+91', 'IN'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                          ),
                          labelText: "Enter your phone number",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter LastName";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Email",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: !authProvider.isObscured,
                      controller: _passController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: authProvider.passwordVisibility,
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
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: !authProvider.isObscured,
                      controller: _confirmPassController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: authProvider.passwordVisibility,
                              icon: Icon(authProvider.isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          labelText: "Confirm Password",
                          border: const OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: ElevatedButton(
                          //onPressed: _signUp,
                          onPressed: signUp,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white),
                          child: const Text(
                            "Create Account",
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("OR"),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: const Text(
                        "Sign In",
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
      ),
    );
  }
}
