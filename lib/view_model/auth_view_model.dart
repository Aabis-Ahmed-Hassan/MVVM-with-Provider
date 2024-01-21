import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_with_provider/repository/auth_repository.dart';
import 'package:mvvm_with_provider/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  AuthRepository myAuthRepository = AuthRepository();

  bool _loading = false;


  bool get getLoading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    myAuthRepository.loginApi(data).then((value) {
      setLoading(false);

      if (kDebugMode) {
        print(value.toString());
        Utils.showSnackBar('Login Successful', context);
      }
    }).onError((error, onStackTrace) {
      setLoading(false);

      if (kDebugMode) {
        print(error.toString());
        Utils.showSnackBar(error.toString(), context);
      }
    });
  }











  Future<void> signup() async {

  }



}
