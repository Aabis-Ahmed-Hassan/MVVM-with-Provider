import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/view/home_screen.dart';
import 'package:mvvm_with_provider/view/login_screen.dart';
import 'package:mvvm_with_provider/view/signup_screen.dart';

class Routes {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => SignUpView());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                    body: Center(
                  child: Text('No Route Found'),
                )));
    }
  }
}
