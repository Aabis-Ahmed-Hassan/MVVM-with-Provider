import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {


  static toastMessage(String message) {

    Fluttertoast.showToast(msg: message);


  }




  static showFlushBarError (String message, BuildContext context) {

    showFlushbar(context: context, flushbar: Flushbar(

      message: message,

      title:'Warning',
      backgroundColor: Colors.red,
      icon:Icon(Icons.warning),


      duration: Duration(seconds:5),


      margin:EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      
      
      borderRadius: BorderRadius.circular(10),
      

    )..show(context)

    );


  }




}