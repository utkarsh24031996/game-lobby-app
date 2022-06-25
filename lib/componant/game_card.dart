import 'package:flutter/material.dart%20';
import 'package:game_room/modal/get_game_list.dart';
import 'package:game_room/screens/game_card_screen.dart';

import '../constant.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.gameList,
  }) : super(key: key);
  final Game gameList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameCardScrn(gameName: gameList.name!),
            ));
      },
      child: Container(
        width: scWidth(context) / 3.55,
        height: scHeight(context) * 0.2,
        decoration: BoxDecoration(
            border: Border.all(color: lightblue, width: 4),
            color: Colors.white,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: ClipRRect(
                  child: Image.network(
                    gameList.icon!,
                    fit: BoxFit.cover,
                    width: 1000,
                    errorBuilder: (context, error, stackTrace) =>
                        const Text("an error occured"),
                    height: scHeight(context) / 4,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 1,
                child: Text(
                  gameList.name!,
                  style: bodytext2(),
                )),
          ],
        ),
      ),
    );
  }
}
