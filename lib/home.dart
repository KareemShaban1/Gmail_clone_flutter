import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gmail_clone/Screens/mail_page.dart';
import 'package:gmail_clone/Screens/room_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MailPage(),
    RoomPage(),




  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:


        BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,

          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
          items: [
            new BottomNavigationBarItem(
              icon:Icon(Icons.mail_outline,color: Colors.black,size: 30,),
              activeIcon: Icon(Icons.mail,color: Colors.red,size: 30,),
              title: Text('Mail'),


            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.videocam_outlined,color: Colors.black,size: 30,),
              activeIcon: Icon(Icons.videocam,color: Colors.red,size: 30,),
              title: Text('Meet'),
            ),

          ],
        ),




        body: _children[_currentIndex],


      ),
    );
  }




}

