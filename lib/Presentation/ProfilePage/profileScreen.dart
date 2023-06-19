import 'package:flutter/material.dart';
import 'package:medicare/Core/colorScheme.dart';
import 'package:medicare/Core/storage.dart';
import 'package:medicare/common/ui/Ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {

  const Profile({Key? key,}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late SharedPreferences logindata;
  late String username;

  LocalStorage localStorage = LocalStorage();
  String doctorName = "";
  String doctorName2 = "";
  String date = "";
  String date2 = "";
  String name = "";
  String name2 = "";
  String email = "";
  String email2 = "";
  String address = "";
  String address2 = "";
  String phone = "";
  String phone2 = "";
  String details = "";
  String details2 = "";

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getDatas();
      initial();
    });
    super.initState();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }


  Future getDatas() async {
    doctorName = (await localStorage.getDoctorName())!;
    date = (await localStorage.getDate())!;
    name = (await localStorage.getName())!;
    email = (await localStorage.getEmail())!;
    address = (await localStorage.getAddress())!;
    phone = (await localStorage.getPhone())!;
    details = (await localStorage.getDetails())!;
    setState(() {
      doctorName2 = doctorName;
      date2 = date;
      name2 = name;
      email2 = email;
      address2 = address;
      phone2 = phone;
      details2 = details;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
          doctorName2 != "" ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text("Profile",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: Ui.getBoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      UserInfo(
                          title: "Name",
                          text: username,
                          icon: Icons.person),
                      UserInfo(
                        title: "Email",
                        text: email2,
                        icon: Icons.email,
                      ),
                      UserInfo(
                        title: "Address",
                        text: address2,
                        icon: Icons.home,
                      ),
                      UserInfo(
                        title: "Phone",
                        text: phone2,
                        icon: Icons.call,
                      ),
                      UserInfo(
                          title: "Details",
                          text: details2,
                          icon: Icons.details
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ) : Center(
            child: Text("Name : $username",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
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