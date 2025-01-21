import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../service/api_service/api_service.dart';

class OtpScreen extends StatefulWidget {
  final String email; // Field to hold the passed data

  OtpScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  ApiService apiService = ApiService();

  final TextEditingController pin1Controller = TextEditingController();

  final TextEditingController pin2Controller = TextEditingController();

  final TextEditingController pin3Controller = TextEditingController();

  final TextEditingController pin4Controller = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();

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
                      child: Focus(
                        onKeyEvent: (FocusNode node, KeyEvent event) {
                          if (event is KeyDownEvent &&
                              event.logicalKey == LogicalKeyboardKey.backspace &&
                              pin1Controller.text.isEmpty) {
                          }
                          return KeyEventResult.ignored;
                        },
                        child: TextFormField(
                          focusNode: f1,
                          controller: pin1Controller,
                          onChanged: (value) {
                            print("Value===>>$value");
                            if (value.length == 1) {
                              f1.unfocus();
                              FocusScope.of(context).requestFocus(f2);
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          onSaved: (pin1) {},
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey),
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
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: Focus(
                        onKeyEvent: (FocusNode node, KeyEvent event) {
                          if (event is KeyDownEvent &&
                              event.logicalKey == LogicalKeyboardKey.backspace &&
                              pin2Controller.text.isEmpty) {
                            f2.unfocus();
                            FocusScope.of(context).requestFocus(f1);
                          }
                          return KeyEventResult.ignored; // Allow other listeners to handle
                        },
                        child: TextFormField(
                          focusNode: f2,
                          controller: pin2Controller,
                          onChanged: (value) {

                            if (value.isEmpty) {
                              f2.unfocus();
                              FocusScope.of(context).requestFocus(f1);
                            } else if (value.length == 1) {
                              f2.unfocus();
                              FocusScope.of(context).requestFocus(f3);
                            }
                          },
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          onSaved: (pin2) {},
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey),
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
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: Focus(
                        onKeyEvent: (FocusNode node, KeyEvent event) {
                          if (event is KeyDownEvent &&
                              event.logicalKey == LogicalKeyboardKey.backspace &&
                              pin2Controller.text.isEmpty) {
                            f3.unfocus();
                            FocusScope.of(context).requestFocus(f2);
                          }
                          return KeyEventResult.ignored; // Allow other listeners to handle
                        },
                        child: TextFormField(
                          focusNode: f3,
                          controller: pin3Controller,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              f3.unfocus();
                              FocusScope.of(context).requestFocus(f2);
                            } else if (value.length == 1) {
                              f3.unfocus();
                              FocusScope.of(context).requestFocus(f4);
                            }
                          },
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          onSaved: (pin3) {},
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey),
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
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: Focus(
                        onKeyEvent: (FocusNode node, KeyEvent event) {
                          if (event is KeyDownEvent &&
                              event.logicalKey == LogicalKeyboardKey.backspace /*&&
                              pin2Controller.text.isEmpty*/) {
                            f4.unfocus();
                            FocusScope.of(context).requestFocus(f3);
                          }
                          return KeyEventResult.ignored; // Allow other listeners to handle
                        },
                        child: TextFormField(
                          focusNode: f4,
                          controller: pin4Controller,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              f4.unfocus();
                              FocusScope.of(context).requestFocus(f3);
                            }
                            if(value.length==1){
                              f4.unfocus();
                            }
                          },
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          onSaved: (pin4) {},
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: const TextStyle(color: Colors.grey),
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
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Did not receive OTP?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Resend",
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
                const SizedBox(
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
                        apiService.verifyOtp(
                            email: widget.email,
                            otp: otpValue,
                            context: context);
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
