import 'package:flutter/material.dart';
import 'package:game_room/screens/home_screen.dart';
import 'package:game_room/screens/login_screen.dart';
import 'package:game_room/utils/hive_helper.dart';
import '../constant.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    await HiveDbServices().getLoginCred();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: drawercolor),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Close",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                loginCred[0].token != null
                    ? buildMenuItem(
                        text: "Logout",
                        ontap: () async {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: const Text(
                                        "Are you sure you want to logout"),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          await HiveDbServices().deleteLogin();
                                          Navigator.pushReplacementNamed(
                                              context, LoginScreen.routName);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text("You are logged Out"),
                                            animation: null,
                                          ));
                                        },
                                        child: const Text("Yes"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No"),
                                      ),
                                    ],
                                  ));
                        })
                    : buildMenuItem(
                        text: "Login",
                        ontap: () {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routName);
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildMenuItem({required String text, required VoidCallback ontap}) {
    return InkWell(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
            color: Colors.white.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
