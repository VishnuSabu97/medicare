
import 'package:flutter/material.dart';
import 'package:medicare/Presentation/DoctorInfoPage/DocInfoPage.dart';
import 'package:medicare/Core/colorScheme.dart';

class DocDetails extends StatelessWidget {
  const DocDetails({Key? key, required this.imgName, required this.docName}) : super(key: key);

  final String imgName;
  final String docName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  docInfoPage(docName: docName,)),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: const EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          AssetImage('assets/images/docprofile/$imgName'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dr. $docName",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        child: Text(
                          "A brief about the doctor to be added here."
                              " This is more like an introduction about the doctor",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  }