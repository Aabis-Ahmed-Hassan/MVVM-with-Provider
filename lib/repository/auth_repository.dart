import 'package:mvvm_with_provider/data/network/NetworkApiServices.dart';
import 'package:mvvm_with_provider/res/App_urls.dart';

class AuthRepository{




  NetworkApiServices myApiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async{


    try{

      dynamic response = await myApiServices.getPostApiResponse(AppUrls.loginApiUrl, data);
      return response;

    }

    catch(e) {
      throw e;
    }



  }












  Future<dynamic> registerApi(dynamic data ) async {


    try{
      dynamic response = await myApiServices.getPostApiResponse(AppUrls.registerApiUrl, data);
      return response;


    }

    catch(e) {
      throw e;
    }
}





















}