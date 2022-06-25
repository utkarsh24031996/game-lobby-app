import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:game_room/apicall/api_call.dart';
import 'package:game_room/componant/bottom_navigation.dart';
import 'package:game_room/componant/custom_buttom.dart';
import 'package:game_room/utils/validation.dart';
import '../constant.dart';
import '../utils/hive_helper.dart';

class MyProfile extends StatefulWidget {
  static String routeName = '/my_profile_screen';
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String gender = 'notSelected';
  TextEditingController _nameCntrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _mobileCntrl = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Validations validation = Validations();
  ApiCalls apiCalls = ApiCalls();
  bool isLoading = false;
  Future initialValue() async {
    _nameCntrl = TextEditingController(text: userModal.name);
    _emailCtrl = TextEditingController(text: userModal.email);
    // _mobileCntrl = TextEditingController(text: userModal.mobile);
    log(userModal.mobile.toString());
  }

  genderSelect() {
    if (gender == 'notSelected') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please Select Gender')));
    } else {
      log('$gender selected');
    }
  }

  @override
  void initState() {
    super.initState();
    initmethodCall();
  }

  Future initmethodCall() async {
    await apiCalls.getUser(token: loginCred[0].token).then((value) {
      setState(() {
        isLoading = true;
      });
    });
    await initialValue();
    // initialValue();
  }

  @override
  Widget build(BuildContext context) {
    log('mobile ${_mobileCntrl.text}');
    return isLoading == false
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              title: const Text('My Profile'),
              leading: BackButton(
                onPressed: () {
                  Navigator.pushNamed(context, BottomNavigation.routName);
                },
                color: Colors.black,
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Edit Profile',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: bodytext1(),
                            // controller: _nameCntrl,
                            validator: validation.name,
                            initialValue: _nameCntrl.text,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 30),
                              hintText: "Your Name",
                              // labelText: "Enter Your Name",
                              border: outlineEnabledBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: bodytext1(),
                            validator: validation.emailAddressValid,
                            // controller: _emailCtrl,
                            initialValue: _emailCtrl.text,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 30),
                              hintText: "Your email",
                              // labelText: "Enter Your Email",
                              border: outlineEnabledBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: scHeight(context) * 0.065,
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.4))),
                            child: Text(
                              userModal.mobile!,
                              style: bodytext1(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),

                          // TextFormField(
                          //   style: bodytext1(),
                          //   // validator: validation.validateEmail,
                          //   // controller: _mobileCntrl,
                          //   onChanged: (value) {
                          //     log('value $value');
                          //     _mobileCntrl.text = value;
                          //     log('checking ${_mobileCntrl.text}');
                          //   },
                          //   initialValue: _mobileCntrl.text,
                          //   keyboardType: TextInputType.number,
                          //   textInputAction: TextInputAction.next,
                          //   decoration: InputDecoration(
                          //     contentPadding: const EdgeInsets.only(left: 30),
                          //     hintText: "Mobile Number",
                          //     // labelText: "Enter Your Mobile Number",
                          //     border: outlineEnabledBorder(),
                          //   ),
                          // ),

                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Text('Gender'),
                        const SizedBox(
                          width: 10,
                        ),
                        Radio(
                            value: 'Male',
                            groupValue: gender,
                            onChanged: (newValue) {
                              setState(() {
                                gender = newValue.toString();
                              });
                            }),
                        const Text('Male'),
                        const SizedBox(
                          width: 10,
                        ),
                        Radio(
                            value: 'Female',
                            groupValue: gender,
                            onChanged: (newValue) {
                              setState(() {
                                gender = newValue.toString();
                              });
                            }),
                        const Text('Female'),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    CustomButton(
                        ontap: () async {
                          if (_formkey.currentState!.validate()) {
                            log('Validate');
                            await ApiCalls()
                                .patchUpdateProfile(
                                    token: loginCred[0].token,
                                    email: _emailCtrl.text,
                                    gender: gender,
                                    name: _nameCntrl.text)
                                .then((value) {
                              showCustomAlertBox(
                                  context: context,
                                  title: 'Update Saved',
                                  body: 'Profile Updated');
                            });
                          } else {
                            log('not Validate');
                          }
                        },
                        color: lightblue,
                        text: 'Update'),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
  }
}
