
import 'package:flutter/material.dart';
import 'package:medicare/Core/colorScheme.dart';
import 'package:medicare/Presentation/LoginPage/login.dart';
import 'package:medicare/Presentation/MainPage/main_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: pathPainter(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(50),
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("Doctor's Appointment in 2 Minutes", style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),),
                    Text("Finding a doctor was never \nso easy", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),)
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height*0.3,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.asset('assets/images/onBoardDoc.png'),
                    )
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      // MaterialPageRoute(builder: (context) =>  ScreenMainPage()),
                      MaterialPageRoute(builder: (context) =>  LoginPage()),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0,1],
                          colors: [getStartedColorStart,getStartedColorEnd],
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                        )
                    ),
                    child:  const Center(
                      child: Text(
                        "Get Started", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
class pathPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path1Color;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height*0.4);
    path.quadraticBezierTo(size.width*0.35, size.height*0.40, size.width*0.58, size.height*0.6);
    path.quadraticBezierTo(size.width*0.72, size.height*0.8, size.width*0.92, size.height*0.8);
    path.quadraticBezierTo(size.width*0.98, size.height*0.8, size.width, size.height*0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}