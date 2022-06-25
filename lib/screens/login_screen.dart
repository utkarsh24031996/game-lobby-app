import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:game_room/apicall/api_call.dart';
import 'package:game_room/componant/custom_buttom.dart';
import 'package:game_room/constant.dart';
import 'package:game_room/screens/otp_screen.dart';
import 'package:game_room/utils/validation.dart';

class LoginScreen extends StatelessWidget {
  static String routName = "/login_screen";
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text('Welcome to Aakhribaazi', style: xlboldtitle()),
            Image.asset(
              'assets/images/login.png',
              scale: 1.3,
            ),

            const Divider(),
            const Text(
              'Login',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            //text form
            Form(
              key: _formkey,
              child: TextFormField(
                validator: Validations().validateMobile,
                controller: _mobileController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 30),
                  hintText: "Mobile Number",
                  labelText: "Enter Your Mobile Number",
                  border: outlineEnabledBorder(),
                ),
              ),
            ),
            const Spacer(),
            //button
            CustomButton(
                ontap: () async {
                  if (_formkey.currentState!.validate()) {
                    await ApiCalls().singIn(mobileNo: _mobileController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            mobile: _mobileController.text,
                          ),
                        ));
                  } else {
                    log('not validate');
                  }
                },
                color: lightblue,
                text: 'Continue'),
            const Spacer(),
          ],
        ),
      )),
    );
  }
}
