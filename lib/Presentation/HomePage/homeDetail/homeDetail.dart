import 'package:flutter/material.dart';
import 'package:medicare/Presentation/DoctorInfoPage/doctors_details.dart';

class HomeDetail extends StatelessWidget {
  HomeDetail({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: InkWell(
              onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  docInfoPage(docName: docName,)),
                // );
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0, bottom: 20.0),
                child: Column(
                  children: [
                    if(title == "Ortho")
                    DocDetails( imgName: 'doc1.png', docName: 'Susan Thomas',),
                    if(title == "Ortho")
                    DocDetails(imgName: 'doc2.png', docName: 'Paul Barbara',),
                    if(title == "Cardiology")
                      DocDetails(imgName: 'doc3.png', docName: 'Nancy Williams',),
                    if(title == "Cardiology")
                      DocDetails( imgName: 'doc1.png', docName: 'Susan Thomas',),
                    if(title == "Gynaecology")
                      DocDetails(imgName: 'doc2.png', docName: 'Paul Barbara',),
                    if(title == "Gynaecology")
                    DocDetails(imgName: 'doc3.png', docName: 'Nancy Williams',),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
