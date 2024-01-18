import 'package:flutter/material.dart';
import 'package:odc/screens/favorit_screen.dart';
import 'package:odc/screens/home_screen.dart';
import 'package:odc/utils/colors.dart';


class NavigationTools extends StatefulWidget {
  const NavigationTools({super.key});

  @override
  State<NavigationTools> createState() => _NavigationToolsState();
}

class _NavigationToolsState extends State<NavigationTools> {
  var screens = [const HomeScreen(), const FavoriteScreen()];
  var index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        fixedColor: primaryColor,
        elevation: 12,
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        iconSize: 28,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled_rounded,),
            label: 'Most Recent'
            ),


          BottomNavigationBarItem(
            icon: Icon(Icons.star,),
            label: 'Favorites'
            ),
        ]
        ),
    );
  }
}