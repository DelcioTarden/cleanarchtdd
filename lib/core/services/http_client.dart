import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:cleanarchtdd/core/utils/route_util.dart';
import 'package:cleanarchtdd/core/utils/text_util.dart';
import 'package:cleanarchtdd/core/models/exception_model.dart';
export 'package:dio/dio.dart';

const Duration receiveTimeout = Duration(milliseconds: 45000);
const Duration connectTimeout = Duration(milliseconds: 35000);

const Duration connectTimeoutPost = Duration(milliseconds: 45000);
const Duration receiveTimeoutPost = Duration(milliseconds: 35000);

class HttpClient {
  static final HttpClient _httpClient = HttpClient._internal();
  HttpClient._internal();

  static HttpClient get instance {
    return _httpClient;
  }

    Future<Response> delete({@required String? url, @required String? data, bool useFormatData = false, bool showServerError = false, Duration? timeoutConnect, Duration? timeoutReceive, bool isAuth = false}) async {
    Response? response;
    final dio = await _instanceDio(url.toString(), timeoutConnect: timeoutConnect, timeoutReceive: timeoutReceive);
    try {
      
      response = await dio.delete(url.toString(), data: data);
      if (response.data != null) return response;
    } on DioError catch (error) {
      _buildException(error, showServerError);
    }
    return response!.data;
  }

 

  Future<Response> post({@required String? url, @required String? data, bool useFormatData = false, bool showServerError = false, Duration? timeoutConnect, Duration? timeoutReceive, bool isAuth = false}) async {
    Response? response;
    final dio = await _instanceDio(url.toString(), timeoutConnect: timeoutConnect, timeoutReceive: timeoutReceive);
    try {
      
      response = await dio.post(url.toString(), data: data);
      if (response.data != null) return response;
    } on DioError catch (error) {
      _buildException(error, showServerError);
    }
    return response!.data;
  }


  Future<Response?> get({
    @required String? url,
    bool showServerError = false,
    Duration? timeoutConnect,
    Duration? timeoutReceive,
  }) async {
    final dio = await _instanceDio(url.toString(), timeoutConnect: timeoutConnect, timeoutReceive: timeoutReceive);
    try {
      final response = await dio.get(url.toString());
      if (response.data != null) {
        return response;
      }
    } on DioError catch (error) {
      _buildException(error, showServerError);
    }
    return null;
  }

  Future<dynamic> put({
    @required String? url,
    @required String? data,
    bool showServerError = false,
    Duration? timeoutConnect,
    Duration? timeoutReceive,
  }) async {
    final dio = await _instanceDio(url.toString(), timeoutConnect: timeoutConnect, timeoutReceive: timeoutReceive);
    try {
      final response = await dio.put(
        url.toString(),
        data: data,
      );
      if (response.data != null) {
        return response;
      }
    } on DioError catch (error) {
      _buildException(error, showServerError);
    }
    return null;
  }
  

  Future<Dio> _instanceDio(
    String url, {
    Duration? timeoutConnect,
    Duration? timeoutReceive,
  }) async {
    BaseOptions options =  BaseOptions(
      connectTimeout: timeoutConnect ?? connectTimeout,
      receiveTimeout: timeoutReceive ?? receiveTimeout,
      contentType: Headers.jsonContentType,
    );
    final dio = Dio(options);
    final urlAuthUser = await RouteUtil.urlAuthUser;

    if (url.compareTo(urlAuthUser) != 0) {
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
      ));
    }
    return dio;
  }

  void _buildException(DioError? error, bool showServerError) {
    final statusCode = error?.response?.statusCode ?? 500;
    if (error?.type == DioErrorType.unknown) {
      throw ExceptionModel(codigo: 0, msg: !showServerError ? TextUtil.connectionErrorText : error?.response?.data ?? TextUtil.connectionErrorText);
    } else if (error?.type == DioErrorType.connectionTimeout || error?.type == DioErrorType.receiveTimeout) {
      throw ExceptionModel(codigo: 408, msg: TextUtil.runtimeErrorText);
    } else if (statusCode == 401) {
      throw ExceptionModel(codigo: 401, msg: !showServerError ? TextUtil.authUserErrorText : error?.response?.data?.toString());
    } else if (statusCode == 403) {
      throw ExceptionModel(codigo: 403, msg: !showServerError ? TextUtil.authUserErrorText : error?.response?.data?.toString());  
    } else if (statusCode == 404) {
      throw ExceptionModel(codigo: 404, msg: TextUtil.errorServerNotFoundText);
    } else if (statusCode == 406) {
      List<String> lista = (error?.response?.data ?? "").toString().split('<br/>');
      var texto = lista.length >= 2 ? lista[1].toString() : error?.response?.data?.toString();
      throw ExceptionModel(codigo: 406, msg: !showServerError ? TextUtil.httpErrorText : texto ?? "");
    } else if (statusCode == 500 || statusCode > 226) {
      throw ExceptionModel(codigo: 500, msg: !showServerError ? TextUtil.httpErrorText : error?.response?.data?.toString());
    }
  }

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
}
