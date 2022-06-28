import 'package:flutter/material.dart';

class CreateRoom extends StatefulWidget {
  static String routName = '/createRoom';
  const CreateRoom({Key? key}) : super(key: key);

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final List tablist = ['My Room', 'Status'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tablist.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        appBar: AppBar(
          title: const Text('Create Room'),
          leading: const BackButton(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: TabBarView(children: [createRooms(), status()]),
        ),
      ),
    );
  }

  ListView createRooms() {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        child: const Text('My Rooms'),
      ),
    );
  }

  ListView status() {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        child: const Text('status'),
      ),
    );
  }
}
