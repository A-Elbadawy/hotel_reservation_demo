//import 'package:get/get_connect/connect.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:reservation_demo/models/api_response.dart';
import 'package:reservation_demo/utils/constants.dart';

String noInternetMsg = 'Please Check Your Internet Connection';
String timeoutMsg = "Time Out! Please Try Agin";
String tryAgainMsg = "Please Try Again";
String errorOccuredMsg = "An Error Occured";
String unauthorizedMsg = "You are unauthorized to complete this action";

const int timeoutDuration = 30;

///
const baseUrl = 'https://qa-testing-backend-293b1363694d.herokuapp.com//api/v3';

///
Map<String, String> defaultHeaders() {
  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

Map<String, String> authHeader() {
  return {'Authorization': 'Bearer ${MyConstants.token}'};
}

Future<APIResponse> getRequest(String endPoint,
    {Map<String, String>? headers}) async {
  APIResponse response = APIResponse();
  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;
    Map<String, String> allHeaders = defaultHeaders();
    if (headers != null) {
      allHeaders.addAll(headers);
    }
    String url = '$baseUrl$endPoint';
    Response res = await get(Uri.parse(url), headers: allHeaders)
        .timeout(const Duration(seconds: timeoutDuration), onTimeout: (() {
      response.error = true;
      response.errorMessage = timeoutMsg;
      return Response('"message": "$timeoutMsg"', 408);
      //throw "Time Out! Please try again";
    }));
    if (kDebugMode) {
      print('Status: ${res.statusCode}, URL: $url');
    }
    return await handleResponse(res);
  } catch (e) {
    return await handleResponseError(e);
  }
}

Future<APIResponse> handleResponseError(e) async {
  if (kDebugMode) {
    print("handleResponseError");
    print(e);
  }
  APIResponse response = APIResponse();
  response.error = true;
  if (!await isNetworkAvailable()) {
    response.errorMessage = noInternetMsg;
    //throw noInternetMsg;
  } else {
    response.errorMessage = tryAgainMsg;
    //throw "Please try again";
  }
  return response;
}

Future<APIResponse> handleResponse(Response res) async {
  APIResponse response = APIResponse();
  if (res.statusCode.isSuccessful()) {
    response.data = res.body.isJson() ? jsonDecode(res.body) : res.body;
  } else {
    response.error = true;
    if (res.body.isJson()) {
      var body = jsonDecode(res.body);
      if (body['message'] != null && res.statusCode != 500) {
        response.errorMessage = body['message'];
        if (res.statusCode == 401) {
          response.errorMessage = unauthorizedMsg;
        }
      } else {
        // avoid display internal server errors
        response.errorMessage = "$errorOccuredMsg, $tryAgainMsg";
      }
      if (body['errors'] != null) {
        response.errors = body['errors'];
      }
    } else {
      if (!await isNetworkAvailable()) {
        response.errorMessage = noInternetMsg;
      } else {
        response.errorMessage = "$errorOccuredMsg, $tryAgainMsg";
      }
    }
    if (kDebugMode) {
      print("response.errorMessage");
      print(response.errorMessage);
      print(response.errors);
    }

  }
  return response;
}
