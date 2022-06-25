import 'package:flutter/cupertino.dart';
import 'package:game_room/componant/bottom_navigation.dart';
import 'package:game_room/screens/home_screen.dart';
import 'package:game_room/screens/login_screen.dart';
import 'package:game_room/screens/match_details.dart';
import 'package:game_room/screens/my_profile.dart';
import 'package:game_room/screens/notification.dart';
import 'package:game_room/screens/otp_screen.dart';
import 'package:game_room/screens/rooms.dart';
import 'package:game_room/screens/signup_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routName: (context) => LoginScreen(),
  SignupScreen.routName: (context) => SignupScreen(),
  OtpScreen.routName: (context) =>  OtpScreen(mobile: '',),
  HomeScreen.routName: (context) => const HomeScreen(),
  BottomNavigation.routName: (context) => const BottomNavigation(),
  NotificationScn.routName: (context) => const NotificationScn(),
  MatchDetails.routName: (context) => const MatchDetails(),
  CreateRoom.routName: (context) => const CreateRoom(),
  MyProfile.routeName: (context) => const MyProfile(),
};
