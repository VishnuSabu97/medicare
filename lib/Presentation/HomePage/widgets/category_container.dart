
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Presentation/HomePage/homeDetail/homeDetail.dart';

Widget categoryContainer(String imgName, String title, BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomeDetail(title: title)),
      );
    },
    child: SizedBox(
      width: 130,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/category/$imgName'),
          Text(
            "$title",
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          ),
        ],
      ),
    ),
  );
}