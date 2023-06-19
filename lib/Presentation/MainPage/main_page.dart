import 'package:flutter/material.dart';
import 'package:medicare/Presentation/DoctorInfoPage/doctors_details.dart';
import 'package:medicare/Presentation/HomePage/HomePage.dart';
import 'package:medicare/Presentation/MainPage/bottom_nav.dart';
import 'package:medicare/Presentation/MyAppoinmentsPage/submittedAppointmentsAll.dart';
import 'package:medicare/Presentation/ProfilePage/profileScreen.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    HomePage(),
    DoctorDetailWidget(),
    SubmittedAppointmentsAll(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            }),
      ),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}

Widget DoctorDetailWidget() {
  return Container(
    margin: EdgeInsets.all(20),
    child: ListView(
      children: const [
        DocDetails(
          imgName: 'doc1.png',
          docName: 'Susan Thomas',
        ),
        DocDetails(
          imgName: 'doc2.png',
          docName: 'Paul Barbara',
        ),
        DocDetails(
          imgName: 'doc3.png',
          docName: 'Nancy Williams',
        ),
        DocDetails(
          imgName: 'doc1.png',
          docName: 'Susan Thomas',
        ),
        DocDetails(
          imgName: 'doc2.png',
          docName: 'Paul Barbara',
        ),
        DocDetails(
          imgName: 'doc3.png',
          docName: 'Nancy Williams',
        ),
      ],
    ),
  );
}
