import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../controller/all_in_provider.dart';

class APICall {
  // final apiBaseUri = 'https://ntpcsafety.solarman.in/api/';
  // final apiBaseUri = 'https://coalmining.ntpc.co.in/api/';
  var dio = Dio();

  Future<dynamic> getRequest(String endPoint) async {
    // var apiUrl = Uri.parse(apiBaseUri + endPoint);

    try {
      final apiResponse = await dio.get(AllInProvider.apiBaseUri + endPoint);
      if (apiResponse.statusCode == 200) {
        final finalResponse = apiResponse.data;
        // print("decode ${json.decode(apiResponse.data)} ");
        return finalResponse;
      }
    } catch (error) {
      print("Error service $error");
    }
  }

  Future<dynamic> getRequest1(String endPoint) async {
    // var apiUrl = Uri.parse(apiBaseUri + endPoint);
    try {
      final apiResponse = await dio.get(endPoint);
      if (apiResponse.statusCode == 200) {
        final finalResponse = apiResponse.data;
        // print("decode ${json.decode(apiResponse.data)} ");
        return finalResponse;
      }
    } catch (error) {
      print("Error service $error");
    }
  }

  Future<dynamic> postRequest(String endPoint, dynamic postData) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer rCEREfprrUOndLaxg1bOfEvLF'
    };
    // var apiUrl = Uri.parse(
    //   apiBaseUri + endPoint,
    // );
    // print("$apiBaseUri$endPoint");

    //encoded Data
    try {
      final apiResponse = await dio.post(
        AllInProvider.apiBaseUri + endPoint,
        options: Options(
          headers: headers,
          followRedirects: false,
          validateStatus: (status) => true,
        ),
        data: json.encode(postData),
      );
      // log("apiResponse $apiResponse");
      // print("decode ${json.decode(apiResponse.data)} ");
      final finalResponse = apiResponse.data;
      return finalResponse;
    } catch (error) {
      print("Error12345 $error");
    }
  }

  Future<dynamic> postRequestNew(String endPoint, dynamic postData) async {
    var apiUrl = Uri.parse(
      AllInProvider.apiBaseUri + endPoint,
    );

    // print("$apiBaseUri$endPoint");

    //encoded Data
    try {
      final apiResponse = await http.post(apiUrl,
          headers: {'Content-type': 'application/json'},
          body: json.encode(postData));

      final finalResponse = json.decode(apiResponse.body);
      return finalResponse;
    } catch (error) {
      print("Error12345 $error");
      throw error;
    }
  }
}
