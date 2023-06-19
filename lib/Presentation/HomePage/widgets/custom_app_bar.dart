

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomAppBar () {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    automaticallyImplyLeading: false,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Find Your ',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Text(
          'Specialist',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.messenger_outline_outlined,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    ],
  );
}