import 'package:flutter/material.dart';
import 'package:medicare/Presentation/MainPage/bottom_nav.dart';
import 'package:medicare/Presentation/HomePage/widgets/category_container.dart';
import 'package:medicare/Presentation/HomePage/widgets/custom_app_bar.dart';
import 'package:medicare/Presentation/DoctorInfoPage/doctors_details.dart';
import 'package:medicare/Core/colorScheme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: CustomPaint(
              painter: pathPainter(),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomAppBar(),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 10, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Select a Category",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 120,
                          margin: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                categoryContainer("category1.png", "Ortho", context),
                                categoryContainer("category5.png", "Cardiology", context),
                                categoryContainer("category8.png", "Gynaecology", context),
                                categoryContainer("category3.png", "Physician", context),
                                categoryContainer("category2.png", "Dietician", context),
                                categoryContainer("category4.png", "Paralysis", context),
                                categoryContainer("category6.png", "MRI - Scan", context),
                                categoryContainer("category7.png", "CT-Scan", context),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "Chief Doctors",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.6,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            children: const <Widget>[
                              DocDetails( imgName: 'doc1.png', docName: 'Susan Thomas',),
                              DocDetails(imgName: 'doc2.png', docName: 'Paul Barbara',),
                              DocDetails(imgName: 'doc3.png', docName: 'Nancy Williams',),
                              DocDetails( imgName: 'doc1.png', docName: 'Susan Thomas',),
                              DocDetails(imgName: 'doc2.png', docName: 'Paul Barbara',),
                              DocDetails(imgName: 'doc3.png', docName: 'Nancy Williams',),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
class pathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path2Color;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.03,
        size.width * 0.42, size.height * 0.17);
    path.quadraticBezierTo(
        size.width * 0.35, size.height * 0.32, 0, size.height * 0.29);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
