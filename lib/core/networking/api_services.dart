import 'package:dio/dio.dart';
import 'package:spacex/core/networking/end_boint.dart';

class ApiServices {
  static Dio? _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: false,
      ),
    );
  }

  static Future<Response> put({
    required String url,
    required Map<String, dynamic> body,
    required String token,
    Map<String, String>? headers,
    String contentType = 'application/json',
  }) async {
    // Set the headers for the request
    _dio?.options.headers = {
      'Content-Type': contentType,
      'Authorization': 'Bearer $token',
      ...?headers,
    };

    // Make the PUT request and return the response
    Response response = await _dio!.put(
      url,
      data: body,
    );

    return response;
  }

  static Future<Response> post(
      {required body,
      required String url,
      required String token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await _dio!.post(url,
        data: body,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $token"},
        ));

    return response.data;
  }

  static Future<Map<String, dynamic>> postData(
      {required String endpoint,
      required Object? data,
      String? token,
      Options? options}) async {
    _dio?.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    var response = await _dio!.post(endpoint, data: data, options: options);
    return response.data;
  }

  static Future<Map<String, dynamic>> postFormData({
    required String endpoint,
    required FormData formData,
    String? token,
  }) async {
    _dio?.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    };
    var response = await _dio!.post(
      endpoint,
      data: formData,
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> deletFormData({
    required String endpoint,
    required FormData formData,
    String? token,
  }) async {
    _dio?.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    };
    var response = await _dio!.delete(
      endpoint,
      data: formData,
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> getFormData({
    required String endpoint,
    required FormData formData,
    String? token,
  }) async {
    _dio?.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    };
    var response = await _dio!.get(
      endpoint,
      data: formData,
    );
    return response.data;
  }

  static Future getData({
    required String endpoint,
    Map<String, String>? data,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    _dio?.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await _dio!.get(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
    return response.data;
  }
}

class ApiService {
  final Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $token"},
        ));

    return response;
  }
}

//
// import 'package:dio/dio.dart';
//
// class ApiService {
//   final baseUrl = "https://api.spacexdata.com/v4/";
//   final Dio dio;
//
//   ApiService(this.dio);
//
//   Future get({required String endPoint}) async {
//     var response = await dio.get("$baseUrl$endPoint");
//
//     return response.data;
//   }
// }
