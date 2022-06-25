import 'package:flutter/material.dart';
import 'package:game_room/constant.dart';

class NotificationScn extends StatelessWidget {
  static String routName = '/notification_screen';
  const NotificationScn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          leading: const BackButton(color: Colors.black,)),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                notificationCard(),
                notificationCard(),
                notificationCard(),
              ],
            ),
          ),
        ));
  }

  ///notification card to show notification
  Widget notificationCard() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: lightblue.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Expanded(
                flex: 4,
                child: Text(
                    'This is notification.. where user recieved notification')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: bellBadgeColor,
                ),
                label: const Text(
                  'Clear',
                  style: TextStyle(color: bellBadgeColor),
                )),
          ]),
          //  Spacer(flex: 2),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: const Text.rich(TextSpan(children: [
              TextSpan(text: '13-03-2022'),
              WidgetSpan(
                  child: SizedBox(
                width: 5,
              )),
              TextSpan(text: '04:00pm')
            ])),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
