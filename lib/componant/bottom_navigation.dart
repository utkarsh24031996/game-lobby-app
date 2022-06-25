import 'package:flutter/material.dart';
import 'package:game_room/constant.dart';
import 'package:game_room/screens/home_screen.dart';
import 'package:game_room/screens/my_profile.dart';

class BottomNavigation extends StatefulWidget {
  static String routName = "/bottom_navigation";
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 5)
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(15)),
              color: Colors.white),
          height: scHeight(context) * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  text: 'Home',
                  selected: _selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  icon: Icons.home_rounded),
              IconBottomBar(
                  text: 'Earn',
                  selected: _selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  icon: Icons.wallet_giftcard),
              IconBottomBar(
                  text: 'Play',
                  selected: _selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  icon: Icons.play_arrow_rounded),
              IconBottomBar(
                  text: 'Me',
                  selected: _selectedIndex == 3,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  icon: Icons.emoji_emotions_rounded),
            ],
          )),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final bool selected;
  final IconData icon;
  final Function() onPressed;

  const IconBottomBar(
      {key,
      required this.text,
      required this.selected,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
          iconSize: 30,
          onPressed: onPressed,
          icon: Icon(icon, color: selected ? lightblue : Colors.grey)),
      Text(text,
          style: TextStyle(
              fontSize: 12,
              height: .4,
              color: selected ? lightblue : Colors.grey)),
      const SizedBox(
        height: 5,
      )
    ]);
  }
}
