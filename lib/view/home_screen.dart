import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: InkWell(
          onTap: (){

           Utils.showSnackBar('No Internet Connection', context);

          },

          child: Container(
            height: 50,
            width: 50,
            color: Colors.indigo ,
            child:Center(child:Text('Click Me'),),
          ),
        ),
      ),
    );
  }
}
