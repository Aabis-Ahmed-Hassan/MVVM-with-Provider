import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/routes.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(


      providers: [

        ChangeNotifierProvider(create: (_)=>AuthViewModel()),

      ],
      child: MaterialApp(
        theme:ThemeData(
          primarySwatch:Colors.red,


        ),



        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.getRoutes,
      ),


    ) ;
  }
}
