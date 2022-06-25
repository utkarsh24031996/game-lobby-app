import 'package:flutter/material.dart';

import '../constant.dart';

///detail game card
class GameDescripCard extends StatelessWidget {
  final bool matchStarted;
  final bool notJoined;
  const GameDescripCard(
      {Key? key, required this.matchStarted, required this.notJoined})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          //logo and game name with date time
          Row(
            children: const [
              CircleAvatar(
                radius: 30,
                // child: Image.asset(''),
              ),
              SizedBox(
                width: 10,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'BGMI\n',
                    style: TextStyle(
                      fontSize: 16,
                    )),
                TextSpan(
                    text: 'Time 03-02-2022 at 02:00 pm',
                    style: TextStyle(color: Colors.grey)),
              ])),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //description details
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  descriptionText(title: 'Win Prize', value: '₹320'),
                  descriptionText(title: 'Entry Fee', value: '₹50'),
                  descriptionText(title: 'Per Kill', value: '₹50'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  descriptionText(title: 'Type', value: 'SOLO'),
                  descriptionText(title: 'Version', value: 'TPP'),
                  descriptionText(title: 'Map', value: 'Tpp'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              matchStarted
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(width: 1, color: lightblue)),
                      onPressed: () {},
                      child: const Text(
                        'Match Started',
                        style: TextStyle(color: Colors.green),
                      ))
                  : const SizedBox(),
              notJoined
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(width: 1, color: lightblue)),
                      onPressed: () {},
                      child: const Text(
                        'Not Joined',
                        style: TextStyle(color: bellBadgeColor),
                      ))
                  : const SizedBox(),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox descriptionText({required String title, required String value}) {
    return SizedBox(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: '$title\n', style: titleTextStyle()),
        TextSpan(
          text: value,
          style: valuTextStyle(),
        ),
      ])),
    );
  }
}
