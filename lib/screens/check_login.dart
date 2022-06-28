import 'package:flutter/material.dart';
import 'package:game_room/componant/bottom_navigation.dart';
import 'package:game_room/constant.dart';
import 'package:game_room/screens/login_screen.dart';
import 'package:game_room/utils/hive_helper.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  Future loginCheck(BuildContext context) async {
    await HiveDbServices().getLoginCred();
    if (loginCred.isNotEmpty) {
    
      Navigator.pushNamed(context, BottomNavigation.routName);
    } else {
      Navigator.pushNamed(context, LoginScreen.routName);
    }
  }

  @override
  void initState() {
    loginCheck(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CircularProgressIndicator(
        color: lightblue,
      )),
    );
  }
}
