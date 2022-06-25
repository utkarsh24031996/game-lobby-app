import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:game_room/componant/bottom_navigation.dart';
import 'package:game_room/componant/custom_buttom.dart';
import 'package:game_room/constant.dart';
import 'package:game_room/screens/my_profile.dart';
import 'package:game_room/utils/hive_helper.dart';
import 'package:game_room/utils/local_storage.dart';
import '../apicall/api_call.dart';
import 'home_screen.dart';

class OtpScreen extends StatelessWidget {
  static String routName = '/otp_screen';
  final String mobile;

  OtpScreen({Key? key, required this.mobile}) : super(key: key);
  final GlobalKey<FormState> _fomrkey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  Future verifyOTP(BuildContext context) async {
    log(_otpController.text.toString());
    log(mobile.toString());
    await ApiCalls().verifyOtpApi(mobileNo: mobile, otp: _otpController.text);

    if (verifyOtp.success == true) {
      await HiveDbServices().addLogin(LoginCred(token: verifyOtp.data!.token!));
      //otp validate
      if (verifyOtp.data!.user!.isProfileCompleted.toString() == '0') {
        
        Navigator.pushReplacementNamed(context, MyProfile.routeName);
      } else {
        Navigator.pushNamed(context, BottomNavigation.routName);
      }
    } else if (verifyOtp.success == false) {
      //otp invalid
      showCustomAlertBox(
          context: context, title: 'Otp Invalid', body: verifyOtp.message!);
    } else {
      throw 'Somwthing Went Wrong';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'OTP Verification',
              style: xlboldtitle(),
            ),
            Expanded(flex: 2, child: Image.asset('assets/images/otp.png')),
            const Text(
              'Verification code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('We have sent otp to your register mobile number'),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '+91 $mobile',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  radius: 10,
                  backgroundColor: darkblue,
                  child: Icon(
                    Icons.edit,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _fomrkey,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: TextField(
                    controller: _otpController,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 10),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Dont recieve the code?'),
              TextButton(onPressed: () {}, child: const Text('Resend again'))
            ]),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
                ontap: () async {
                  if (_fomrkey.currentState!.validate()) {
                    verifyOTP(context);
                  }
                },
                color: lightblue,
                text: "Continue"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
