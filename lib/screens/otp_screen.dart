import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../service/api_service/api_service.dart';

class OtpScreen extends StatelessWidget {
  final String email; // Field to hold the passed data

  OtpScreen({Key? key, required this.email}) : super(key: key);
  ApiService apiService = ApiService();
  final TextEditingController pin1Controller = TextEditingController();
  final TextEditingController pin2Controller = TextEditingController();
  final TextEditingController pin3Controller = TextEditingController();
  final TextEditingController pin4Controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Scaffold(
            body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const Text(
                  "Please Enter OTP",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your One Time Password(OTP) has been sent via Email to your registered Email address.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: pin1Controller,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin1) {},
                        decoration: InputDecoration(
                          hintText: "0",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: pin2Controller,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin2) {},
                        decoration: InputDecoration(
                          hintText: "0",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: pin3Controller,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin3) {},
                        decoration: InputDecoration(
                          hintText: "0",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: pin4Controller,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin4) {},
                        decoration: InputDecoration(
                          hintText: "0",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Colors.orangeAccent,
                            ),),
                          //filled: true,
                        ),
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Did not receive OTP?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend",
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: ElevatedButton(
                      onPressed: () {
                        String otpValue = "${pin1Controller.text.toString()}"
                            "${pin2Controller.text.toString()}"
                            "${pin3Controller.text.toString()}"
                            "${pin4Controller.text.toString()}";
                        apiService.verifyOtp(email: email, otp: otpValue);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 16),
                      )),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
