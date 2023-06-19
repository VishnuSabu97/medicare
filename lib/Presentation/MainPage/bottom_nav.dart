
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context,int newIndex,_){
      return BottomNavigationBar(
        currentIndex: newIndex,
        onTap: (index){
          indexChangeNotifier.value = index;
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.groups, color: Colors.black,), label: 'Doctors'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined, color: Colors.black,), label: 'My Appoinments'),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black,), label: 'Profile'),
        ],
      );
    }
    );
  }
}
