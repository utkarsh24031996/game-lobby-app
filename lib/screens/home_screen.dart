import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_room/apicall/api_call.dart';
import 'package:game_room/componant/app_drawer.dart';
import 'package:game_room/constant.dart';
import 'package:game_room/screens/notification.dart';

import '../componant/game_card.dart';

class HomeScreen extends StatefulWidget {
  static String routName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _token;

  TextStyle titieStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700);
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();
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

  @override
  void initState() {
    getAllApiCalls();
    super.initState();
  }

  getAllApiCalls()async{
    await ApiCalls().getbannerimages();
    await ApiCalls().getGameLists();

  }

  @override
  Widget build(BuildContext context) {
    //carousel slider list

    final List<Widget> imageslider = bannerList
        .map(
          (e) => SizedBox(
            child: Image.network(
              e.image,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  const Text("an error occured"),
              height: scHeight(context) / 4,
              width: 1000,
            ),
          ),
        )
        .toList();
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: const AppDrawer(),
      // Drawer(
      //   backgroundColor: drawercolor,
      //   child: SafeArea(
      //     child: Container(
      //       decoration: const BoxDecoration(color: drawercolor),
      //       child: Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: Column(
      //           children: [
      //             Align(
      //               alignment: Alignment.topLeft,
      //               child: TextButton.icon(
      //                 onPressed: () {
      //                   Navigator.pop(context);
      //                 },
      //                 icon: const Icon(
      //                   Icons.cancel_outlined,
      //                   color: Colors.white,
      //                 ),
      //                 label: const Text(
      //                   "Close",
      //                   style: TextStyle(color: Colors.white, fontSize: 16),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 30,
      //             ),
      //             buildMenuItem(
      //                 text: 'Create Room',
      //                 ontap: () {
      //                   Navigator.pop(context);
      //                 }),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             _token != null
      //                 ? buildMenuItem(
      //                     text: "Logout",
      //                     ontap: () async {
      //                       Navigator.pop(context);
      //                       showDialog(
      //                           context: context,
      //                           builder: (context) => AlertDialog(
      //                                 content: const Text(
      //                                     "Are you sure you want to logout"),
      //                                 actions: [
      //                                   TextButton(
      //                                     onPressed: () async {
      //                                       // await Utils().deleteLogincred();
      //                                       // await Utils().deleteNotifyValue();
      //                                       Navigator.pushReplacementNamed(
      //                                           context, HomeScreen.routName);
      //                                       ScaffoldMessenger.of(context)
      //                                           .showSnackBar(const SnackBar(
      //                                         content:
      //                                             Text("You are logged Out"),
      //                                         animation: null,
      //                                       ));
      //                                     },
      //                                     child: const Text("Yes"),
      //                                   ),
      //                                   TextButton(
      //                                     onPressed: () {
      //                                       Navigator.pop(context);
      //                                     },
      //                                     child: const Text("No"),
      //                                   ),
      //                                 ],
      //                               ));
      //                     })
      //                 : buildMenuItem(
      //                     text: "Login",
      //                     ontap: () {
      //                       Navigator.pop(context);
      //                       // Navigator.pushReplacementNamed(
      //                       //     context, LoginScreen.routName);
      //                     })
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
   
      appBar: AppBarWidget(
        appBar: AppBar(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //carousel slider
            //image slider(Carousel Slider)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CarouselSlider(
                items: imageslider,
                carouselController: _controller,
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                    autoPlay: true,
                    // enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, _) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),

            //slider dot
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageslider.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 7.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? darkblue.withOpacity(0.3)
                                : darkblue)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  //contest and tournament
                  Text(
                    'CONTEST & TOURNAMENTS',
                    style: titieStyle(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: getGameList.length,
                    itemBuilder:(context, index) {
                      return GameCard(gameList:getGameList[index]);
                  
                  }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10),),
                  const SizedBox(
                    height: 20,
                  ),
                  //upcoming tournament
                  Text(
                    'UPCOMING TOURNAMENT',
                    style: titieStyle(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: lightblue,
                          borderRadius: BorderRadius.circular(6)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                'assets/images/bgmi_tournment.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Game Room',
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text.rich(TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.access_time,
                                size: 18,
                                color: Colors.grey,
                              )),
                              TextSpan(
                                text: '1st Nov to 20th Jan 2022',
                              )
                            ])),
                            Text.rich(TextSpan(children: [
                              WidgetSpan(
                                  child:
                                      Image.asset('assets/icons/trophy1.png')),
                              const TextSpan(text: '₹ 20000')
                            ])),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.appBar,
  }) : super(key: key);
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: SvgPicture.asset(
              "assets/icons/drawer.svg",
              width: 28,
              height: 28,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      // automaticallyImplyLeading: true,
      title: const Text('Home'),
      actions: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, NotificationScn.routName);
              },
              icon: const Icon(
                Icons.notifications,
                size: 30,
                color: lightblue,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              alignment: Alignment.center,
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bellBadgeColor,
              ),
              child: const Text(
                "5",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
