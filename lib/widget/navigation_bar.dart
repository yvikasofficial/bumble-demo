import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      selectedItemColor: Colors.black45,
      unselectedItemColor: Colors.grey.withOpacity(0.5),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Hi",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.imagesearch_roller),
          label: "Hi",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_bubble,
          ),
          label: "Hi",
        ),
      ],
    );
  }
}
