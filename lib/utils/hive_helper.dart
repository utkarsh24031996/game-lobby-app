import 'dart:developer';

import 'package:game_room/utils/local_storage.dart';
import 'package:hive/hive.dart';

 List<LoginCred> loginCred=[];

class HiveDbServices {
  final String _loginBoxName = 'Login';

  ///open box of login form
  Future<Box> loginBox() async {
    var box = await Hive.openBox<LoginCred>(_loginBoxName);
    return box;
  }

  ///add login data to hive box
  Future<bool> addLogin(LoginCred loginData) async {
    var box = await loginBox();
    bool isSaved = false;
    int inserted = await box.add(loginData);
    isSaved = inserted == 1 ? true : false;
    return isSaved;
  }

  Future<List<LoginCred>> getLoginCred() async {
    var box = await loginBox();
    loginCred = box.values.map<LoginCred>((e) => e).toList();
    log(loginCred.map((e) => e.token).toString());
    return loginCred;
  }

  ///clear delete login
  Future<Box> deleteLogin() async {
    final box = await loginBox();
    getLoginCred();
    log('login cred ${loginCred.map((e) => e.token).toString()}');
    await box.clear();
    return box;
  }
}
