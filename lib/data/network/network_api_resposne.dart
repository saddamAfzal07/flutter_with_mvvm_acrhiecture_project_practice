import 'dart:convert';
import 'dart:io';

import 'package:flutter_with_mvvm_acrhiecture/data/exceptions.dart';
import 'package:flutter_with_mvvm_acrhiecture/data/network/base_api_resposne.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiResponse {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw FetchDataException(
          response.statusCode.toString(),
        );
      case 404:
        throw FetchDataException(
          response.statusCode.toString(),
        );
      default:
        throw FetchDataException(
          "Error occred while commnication with server " +
              "with status code " +
              response.statusCode.toString(),
        );
    }
  }
}
