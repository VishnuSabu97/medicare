
import 'package:flutter/material.dart';
import 'package:medicare/Core/colorScheme.dart';
import 'package:medicare/Presentation/MyAppoinmentsPage/appoinment_details.dart';

class docInfoPage extends StatefulWidget {

  final String docName;
  const docInfoPage({Key? key, required this.docName}) : super(key: key);

  @override
  _docInfoPageState createState() => _docInfoPageState();
}

class _docInfoPageState extends State<docInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [getStartedColorStart, getStartedColorEnd],
            begin: const Alignment(0, -1.15),
            end: const Alignment(0,0.1),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/docinfo/bg1.png'),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: bgColor,
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/docprofile/doc1.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text("Dr. Susan Thomas", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),),
                              Text("Heart Surgeon - CK Hospital", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("About the Doctor", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),),
                            const SizedBox(height: 10,),
                            const Text("Please write the description of the doctor here. This will be a detailed information about the doctor and the roles and achievements that the doctor has had over the past years", style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),),
                            const SizedBox(height: 10,),
                            const Text("Available Time Slots", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),),
                            const SizedBox(height: 5,),
                            timeSlotWidget("13", "MAY", "Consultation", "Sunday 9 am to 11.30 am"),
                            timeSlotWidget("14", "MAY", "Consultation", "Monday 10 am to 12.30 am"),
                            timeSlotWidget("1", "JUN", "Consultation", "Wednesday 8 am to 12.30 pm"),
                            timeSlotWidget("3", "JUN", "Consultation", "Friday 8 am to 1 am"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
  GestureDetector timeSlotWidget(String date, String month, String slotType, String time)
  {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AppointmentPage(docName: widget.docName, slot: slotType, month: month, date: date, time: time,)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: docContentBgColor
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: dateBgColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("$date", style: TextStyle(
                      color: dateColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w800
                    ),),
                    Text("$month", style: TextStyle(
                      color: dateColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800
                    ),)
                  ],
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("$slotType", style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),),
                  Text("$time", style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600
                  ),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
