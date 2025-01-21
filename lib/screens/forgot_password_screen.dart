import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forgot Password", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                      onPressed: () {
                        authProvider.passwordVisibility();
                      },
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
              height: 20,
            ),
            TextFormField(
              controller: _passController,
              obscureText: !authProvider.isObscured,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        authProvider.passwordVisibility();
                      },
                      icon: Icon(authProvider.isObscured
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  labelText: "New Password",
                  border: const OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Password";
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
