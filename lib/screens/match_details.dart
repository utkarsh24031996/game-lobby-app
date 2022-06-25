import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class MatchDetails extends StatefulWidget {
  static String routName = '/match_details';
  const MatchDetails({Key? key}) : super(key: key);

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  List tablist = ['Overview', 'Participants', 'Rules'];

  @override
  Widget build(BuildContext context) {
    return 
    DefaultTabController(
      length: tablist.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Match Details'),
          leading: const BackButton(color: Colors.black),
          bottom:
           ButtonsTabBar(
              duration: 0,
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
          child: TabBarView(children: [overView(), participants(), rules()]),
        ),
      ),
    );
  
  }

  ///participants method
  ListView participants() {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Column(
              children: [
                //show join count total participants
                Card(
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: scHeight(context) * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total Participants',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '91',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                          TextSpan(
                              text: ' / ',
                              style: TextStyle(
                                  color: lightblue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: '92'),
                        ]))
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: scHeight(context) * 0.08,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 2,
                            offset: Offset(0, 0),
                            color: lightblue,
                            blurRadius: 0)
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Text('Taha Ansari'),
                )
              ],
            ));
  }

  ///overview method
  ListView overView() {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                SizedBox(
                  height: scHeight(context) / 4.5,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset(
                        'assets/images/freefire.png',
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                //match description
                const Text(
                  'Solo king - Match #20184',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),

                //prize details

                prizeContainer(text: 'PER KILL', prize: '₹5', color: lightblue),
                prizeContainer(
                    text: '1st PRIZE',
                    prize: '₹50',
                    color: lightblue.withOpacity(0.7)),
                prizeContainer(
                    text: '2nd PRIZE',
                    prize: '₹30',
                    color: lightblue.withOpacity(0.5)),
                prizeContainer(
                    text: '3rd PRIZE',
                    prize: '₹20',
                    color: lightblue.withOpacity(0.4)),

                //starts in
                Container(
                  alignment: Alignment.center,
                  height: scHeight(context) * 0.04,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text(
                    'STARTS IN',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ));
  }

  Widget prizeContainer(
      {required String text, required String prize, required Color color}) {
    return Center(
      child: Container(
        width: scWidth(context) / 2,
        height: scHeight(context) * 0.05,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              prize,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  ListView rules() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: lightblue,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  flex: 5,
                  child: Text(
                      'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ')),
            ],
          ),
        ],
      ),
    );
  }
}
