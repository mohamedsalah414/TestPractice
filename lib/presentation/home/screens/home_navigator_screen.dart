import 'package:flutter/material.dart';
import 'package:testpractice/presentation/home/screens/home_screen.dart';
import 'package:testpractice/presentation/profile/screens/profile_screen.dart';

class HomeNavigatorScreen extends StatefulWidget {
  const HomeNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<HomeNavigatorScreen> createState() => _HomeNavigatorScreenState();
}

class _HomeNavigatorScreenState extends State<HomeNavigatorScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomePageView(),
    ProfileScreen(),
    HomePageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
              debugPrint(selectedIndex.toString());
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home,size: 40,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person_outline,size: 40,),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat_bubble_outline,size: 40,),
              label: 'Support',
            ),
          ]),
    );
  }
}
