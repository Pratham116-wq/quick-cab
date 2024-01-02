import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget CustomButton(String buttonTitle,double height, {required Null Function() onPressed}) {

  return MaterialButton(
      onPressed: () {
        onPressed ();
      },
      child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.orange, Colors.deepOrange])),
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          )));
}
