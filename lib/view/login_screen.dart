import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/res/Colors.dart';
import 'package:mvvm_with_provider/res/components/round_button.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/utils/utils.dart';
import 'package:mvvm_with_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();


  ValueNotifier<bool> showPassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    final authViewMode = Provider.of<AuthViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Login'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: emailFocusNode,
                onFieldSubmitted: (value) {
                  Utils.FocusNodeMethod(
                      emailFocusNode, passwordFocusNode, context);
                },
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: showPassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: showPassword.value,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: InkWell(
                          onTap: () {
                            showPassword.value = !showPassword.value;
                          },
                          child: Icon(showPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off_outlined),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: height * 0.035,
              ),
              RoundButton(
                  title: 'Login',
                  loading: authViewMode.getLoadingForLogin,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.showSnackBar('Please enter your email', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.showSnackBar('Please Enter your password', context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.showSnackBar(
                          'Password should be of 6 characters atleast!',
                          context);
                    } else {
                      print('Api hit');

                      Map data = {
                        'email': _emailController.text.toString(),
                        'password': _passwordController.text.toString(),
                      };

                      authViewMode.loginApi(data, context);
                    }
                  }),

              SizedBox(
                height: height * 0.035,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const Text("Don't have an account? ", style:TextStyle(fontSize: 16),),
                  InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RoutesName.signup);

                      },
                      child: const Text("Sign Up", style:TextStyle(fontSize: 16 , decoration: TextDecoration.underline, color: AppColors.defaultColor,),)),




                ],
              )






            ],
          ),
        ));
  }
}
