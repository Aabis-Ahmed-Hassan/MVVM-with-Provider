import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm_with_provider/data/app_exceptions.dart';
import 'package:mvvm_with_provider/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    var responseFromJson;

    try {
      var response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      responseFromJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseFromJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async {

    var responseFromJson;


    try{
      var response =
      await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));

      responseFromJson = returnResponse(response);


    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }


    return responseFromJson;




  }

  dynamic returnResponse(http.Response response) {
    var responseFromJson;
    switch (response.statusCode) {
      case 200:
        responseFromJson = response.body;

        return responseFromJson;
      case 400:
        throw BadRequestException(response.body.toString());

      default:
        FetchDataException(
            'An error occurred while communicating with the server with status code + ${response.statusCode.toString()}');
    }
  }
}
