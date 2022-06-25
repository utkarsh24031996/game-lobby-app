import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_room/constant.dart';
import 'package:game_room/routes.dart';
import 'package:game_room/screens/check_login.dart';
import 'package:game_room/screens/login_screen.dart';
import 'package:game_room/screens/my_profile.dart';
import 'package:game_room/utils/local_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'componant/bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LoginCredAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
            elevation: 0,
            centerTitle: true,
            toolbarTextStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            color: backgroundColor,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark,
                statusBarColor: backgroundColor)),
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: const CheckLogin(),
      // home: const BottomNavigation(),
      // home: const NotificationScn(),
      // home: const MyProfile(),
    );
  }
}
