import 'package:flutter/material.dart ';
import 'package:game_room/componant/bottom_navigation.dart';
import 'package:game_room/constant.dart';

import '../componant/custom_buttom.dart';

class SignupScreen extends StatelessWidget {
  static String routName = "/signup_screen";
   SignupScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
            Text(
              'Register Yourself First',
              style: xlboldtitle(),
            ),
            //image
            Expanded(flex: 2, child: Image.asset('assets/images/singup.png')),
         Divider(),
            const Text(
              'Singup',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
        Form(
            key:_formkey ,
            child: Column(children: [
              TextFormField(
                  // validator: validation.validateEmail,
                  // controller: _emailCtrl,
                  keyboardType: TextInputType.number,

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 30),
                    hintText: "Enter Your Name",
                    labelText: "Your Name",
                    border: outlineEnabledBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
              TextFormField(
                  // validator: validation.validateEmail,
                  // controller: _emailCtrl,
                  keyboardType: TextInputType.number,

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 30),
                    hintText: "Mobile Number",
                    labelText: "Enter Your Mobile Number",
                    border: outlineEnabledBorder(),
                  ),
                ),
                const SizedBox(height: 20,),

              TextFormField(
                  // validator: validation.validateEmail,
                  // controller: _emailCtrl,
                  keyboardType: TextInputType.number,

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 30),
                    hintText: "Email",
                    labelText: "Enter Your Email",
                    border: outlineEnabledBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                 CustomButton(
                ontap: () {
                  Navigator.pushNamed(context, BottomNavigation.routName);
                },
                color: lightblue,
                text: 'Continue'),
            const SizedBox(
              height: 20,
            ),
            Divider(),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset('assets/icons/google_logo.png'),
            ),
            SizedBox(
              height: 10,
            ),
        ]),)
        ],
      ),
          )),
    );
  }
}
