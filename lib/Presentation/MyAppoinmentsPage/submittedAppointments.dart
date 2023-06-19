import 'package:flutter/material.dart';
import 'package:medicare/Core/colorScheme.dart';
import 'package:medicare/Presentation/MainPage/main_page.dart';
import 'package:medicare/common/ui/Ui.dart';

class SubmittedAppointments extends StatelessWidget {

  final String docName, date, month, slot, time, name, phone, email, address, details;
  const SubmittedAppointments({Key? key,
    required this.docName,
    required this.slot,
    required this.month,
    required this.date,
    required this.time,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Submitted Appointments",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: Ui.getBoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      UserInfo(
                        title: "Doctor Name",
                        text: docName,
                        icon: Icons.person,
                      ),
                      UserInfo(
                        title: "Date",
                        text: "${date+" "+time+" "+slot}",
                        icon: Icons.description,
                      ),
                      UserInfo(
                          title: "Name",
                          text: name,
                          icon: Icons.person),
                      UserInfo(
                        title: "Email",
                        text: email,
                        icon: Icons.email,
                      ),
                      UserInfo(
                        title: "Address",
                        text: address,
                        icon: Icons.home,
                      ),
                      UserInfo(
                        title: "Phone",
                        text: phone,
                        icon: Icons.call,
                      ),
                      UserInfo(
                          title: "Details",
                          text: details,
                          icon: Icons.details),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          height: 40,
                          width: 150,
                          child: Center(
                            child: Text("Go to Home",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text('Go to Home',
                                      style: TextStyle(color: Colors.black)),
                                  content: Text(
                                      'Do you want to go back?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Text('No', style: TextStyle(color: Colors.black),),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  ScreenMainPage()),
                                        );
                                      },
                                      child: Text('Yes', style: TextStyle(color: Colors.black),),
                                    ),
                                  ],
                                );
                              }));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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


class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.text,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.all(20),
      decoration: Ui.getBoxDecorationProfile(color: Colors.black),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 14),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}