import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/routes.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.red,


      ),

      initialRoute: RoutesName.home,
      onGenerateRoute: Routes.getRoutes,
    );
  }
}
