import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/res/Colors.dart';
import 'package:mvvm_with_provider/res/components/round_button.dart';
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
        appBar: AppBar(
          title: const Text('My App'),
          centerTitle: true,
          backgroundColor: AppColors.defaultColor,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'HomePage',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(

              height: MediaQuery.of(context).size.height * 0.025,
            ),
            RoundButton(
                title: 'Logout',
                onPress: () {
                  Navigator.pushNamed(context, RoutesName.login);
                })
          ],
        ));
  }
}
