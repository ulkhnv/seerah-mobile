import 'package:flutter/material.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/features/lessons/presentation/lessons_page.dart';
import 'package:seerah/src/features/my_iman/presentation/pages/my_iman_page.dart';
import 'package:seerah/src/features/settings/presentation/page/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const LessonsPage(),
    const MyImanPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(

            unselectedFontSize: 14,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/home/home_line.png",
                  width: 25,
                  height: 25,
                ),
                activeIcon: Image.asset("assets/images/home/home_fill.png",
                    color: Colors.green, width: 25, height: 25),
                label: S.of(context).home_page,
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/home/moon_line.png", width: 25, height: 25),
                activeIcon: Image.asset("assets/images/home/moon_fill.png",
                    color: Colors.green, width: 25, height: 25),
                label: S.of(context).my_iman,
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/home/settings_line.png",
                    width: 25, height: 25),
                activeIcon: Image.asset("assets/images/home/settings_fill.png",
                    color: Colors.green, width: 25, height: 25),
                label: S.of(context).settings,
              ),
            ],
            selectedItemColor: Colors.green),
      ),
    );
  }
}
