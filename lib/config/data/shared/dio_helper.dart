import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';



//Dio Helper That's Connect and Talk to API.
class DioHelper {
  //static late Dio dio;

  //Here The Initialize of Dio and Start Connect to API Using baseUrl.
  //static init() {
   Dio dio = Dio();
  //     BaseOptions(
  //       //Here the URL of API.
  //       baseUrl: baseUrl,
  //
  //       //   receiveDataWhenStatusError: true,
  //       //Here we Put The Headers Needed in The API.
  //       // headers: {
  //       //   'Content-Type': '',
  //       //   //'lang':'en'
  //       // },
  //     ),
  //   );
  // }

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
   Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json; char=UTF-8',
      };
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
   Future postData({
    required String url,
    required var data,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // dio.options.headers = {
      //   //'Content-Type': 'application/json; char=UTF-8',
      // };
      //dio.options.queryParameters=data;
       Response response = await dio.post(
       url,
       options: Options(
         headers: {
           "Content-Type": "application/json"
         }
       ),
       // queryParameters: data,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
   Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json; char=UTF-8',
      };
      final Response response = await dio.put(
        queryParameters: data,
       url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
  //
  // //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  // static Future<Response> patchData({
  //   required String url,
  //   required Map<String, dynamic> data,
  //   required String token,
  //   bool files = false,
  // }) async {
  //   dio.options.headers = {
  //     'Authorization': 'Bearer $token',
  //     // 'Authorization': token ,
  //     'Content-Type': 'application/json',
  //   };
  //   return await dio.patch(
  //     url,
  //     data: data,
  //   );
  // }
  //
  //This Function that's Used To Delete Data to API based on URL(End Points) and Headers.
   Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    //String lang = 'en',
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json; char=UTF-8',
        // 'Authorization': token ,
        //'Content-Type': 'application/json',
      };
      final Response response = await dio.delete(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
