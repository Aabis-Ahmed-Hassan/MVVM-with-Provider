import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_with_provider/repository/auth_repository.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  AuthRepository myAuthRepository = AuthRepository();

  bool _loadingForLogin = false;

  bool get getLoadingForLogin => _loadingForLogin;

  setLoadingForLogin(bool value) {
    _loadingForLogin = value;
    notifyListeners();
  }

  bool _loadingForSignUp = false;

  bool get getLoadingForSignUp => _loadingForSignUp;

  setLoadingForSignUp(bool value) {
    _loadingForSignUp = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoadingForLogin(true);

    myAuthRepository.loginApi(data).then((value) {
      setLoadingForLogin(false);




      if (kDebugMode) {
        print(value.toString());
        Utils.showSnackBar('Login Successful', context);
      }


      Navigator.pushNamed(context, RoutesName.home);

    }).onError((error, onStackTrace) {
      setLoadingForLogin(false);

      if (kDebugMode) {
        print(error.toString());
        Utils.showSnackBar(error.toString(), context);
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {

    setLoadingForSignUp(true);

    myAuthRepository.registerApi(data).then((value) {
      setLoadingForSignUp(false);

      if (kDebugMode) {
        Utils.showSnackBar(value, context);
      }
      Navigator.pushNamed(context, RoutesName.home);

    }).onError((error, onStackTrace) {
      setLoadingForSignUp(false);

      if (kDebugMode) {
        Utils.showSnackBar(error.toString(), context);
      }
    });
  }

//
// Future<void> signup(dynamic data, BuildContext context) async {
//   myAuthRepository.registerApi(data).then((value) {
//     if (kDebugMode) {
//       Utils.showSnackBar('Signup Successful', context);
//     }
//   }).onError((error, onStackTrace) {
//     if (kDebugMode) {
//       Utils.showSnackBar(error.toString(), context);
//     }
//   });
// }
}
