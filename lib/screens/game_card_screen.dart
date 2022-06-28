import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:game_room/componant/game_description_card.dart';
import 'package:game_room/constant.dart';
import 'package:game_room/screens/match_details.dart';

class GameCardScrn extends StatefulWidget {
  final String gameName;
  const GameCardScrn({Key? key, required this.gameName}) : super(key: key);

  @override
  State<GameCardScrn> createState() => _GameCardScrnState();
}

class _GameCardScrnState extends State<GameCardScrn> {
  List tablist = ['Ongoing', 'Upcoming', 'Results'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tablist.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.gameName),
          bottom: ButtonsTabBar(
              duration: 100,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              labelStyle: const TextStyle(color: Colors.white),
              backgroundColor: lightblue,
              unselectedBackgroundColor: lightblue.withOpacity(0.1),
              unselectedLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              tabs: tablist.map((e) {
                return Tab(
                  text: e,
                );
              }).toList()),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child:
              TabBarView(children: [onGoingTab(), upComingTab(), resultTab()]),
        ),
      ),
    );
  }

  ListView onGoingTab() {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => const Card(
                child: GameDescripCard(
              matchStarted: true,
              notJoined: false,
            )));
  }

  ListView resultTab() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const Card(
                child: GameDescripCard(
              matchStarted: false,
              notJoined: true,
            )));
  }

  InkWell upComingTab() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MatchDetails.routName);
      },
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    //image
                    SizedBox(
                      width: double.infinity,
                      height: scHeight(context) / 4,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.asset(
                          'assets/images/battleground_mobile.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //slider with join button

                    //game description card
                    const GameDescripCard(
                      matchStarted: false,
                      notJoined: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //starts in time
                    Container(
                      alignment: Alignment.center,
                      height: scHeight(context) * 0.06,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: const Text(
                        'STARTS IN : 2h 20min 1sec',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
