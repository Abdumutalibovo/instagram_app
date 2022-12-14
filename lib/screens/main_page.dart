import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/screens/home_page.dart';
import 'package:instagram/screens/notification_page.dart';
import 'package:instagram/screens/profile_page.dart';
import 'package:instagram/screens/reelsPage.dart';
import 'package:instagram/screens/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  List<Widget> _pages=[
    HomePage(),
    SearchPage(),
    ReelsPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  int currentPageIndex=0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index){
          setState(() {
            currentPageIndex=index;
          });
        },

        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.movie_creation_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ]),
    );
  }
}