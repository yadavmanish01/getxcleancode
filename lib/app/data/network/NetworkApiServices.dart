import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cleangetxproject/app/data/network/baseApiServices.dart';
import 'package:cleangetxproject/app/data/response/appExceptions.dart';
import 'package:http/http.dart' as http;

class Networkapiservices extends Baseapiservices {
  @override
  Future<void> GetApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetExceptions();
    } on TimeoutException{
      throw RequestTimeoutExceptions();
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      default:
        throw ServerExceptions();
    }
  }
}
