import 'package:flutter/foundation.dart';

import '../models/exception_model.dart';
import 'http_client.dart';

export 'package:dio/dio.dart';

class BaseService {
  Future<dynamic> get({@required String? url, bool showServerError = false, bool isTokenRetrieve = true}) async {
    try {
      return await HttpClient.instance.get(url: url.toString(), showServerError: showServerError);
    } on ExceptionModel catch (e){
      if (e.codigo == 401 && isTokenRetrieve) {
        if (await forcarObterToken()) {
          return await get(url: url, showServerError: showServerError, isTokenRetrieve: false);
        }
      }
      throw ExceptionModel(codigo: e.codigo, msg: _normalizeMsg(e.msg.toString()));
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> post({@required String? url, @required String? data, bool useFormatData = false, List<String>? listFilePath, bool showServerError = false, bool isTokenRetrieve = true}) async {
    try {
      return await HttpClient.instance.post(url: url.toString(), data: data, useFormatData: useFormatData, showServerError: showServerError);
    
    } on ExceptionModel catch (e){
      if (e.codigo == 401 && isTokenRetrieve) {
        if (await forcarObterToken()) {
          return await post(url: url, data: data, useFormatData: useFormatData, listFilePath: listFilePath, showServerError: showServerError, isTokenRetrieve: false);
        }
      }
      throw ExceptionModel(codigo: e.codigo, msg: _normalizeMsg(e.msg.toString()));

    } catch (e) {
      return null;
    }
  }

  Future<dynamic> delete({@required String? url,@required String? data, bool showServerError = false,}) async {
    try {
      return await HttpClient.instance.delete(url: url.toString(), showServerError: showServerError,data: data);
    } on ExceptionModel catch (e){
      throw ExceptionModel(codigo: e.codigo, msg: _normalizeMsg(e.msg.toString()));
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> put({@required String? url, @required String? data, bool isTokenRetrieve = true}) async {
    try {
      return await HttpClient.instance.put(url: url.toString(), data: data.toString());
    } on ExceptionModel catch (e){
      if (e.codigo == 401 && isTokenRetrieve) {
        if (await forcarObterToken()) {
          return await put(url: url, data: data, isTokenRetrieve: false);
        }
      }
      throw ExceptionModel(codigo: e.codigo, msg: _normalizeMsg(e.msg.toString()));
    } catch (e) {
      return null;
    }
  }

  Future<bool> forcarObterToken() async {
    // final String email = await SharedPreferencesHelper.instance.loadData(Util.userEmailKey);
    // final String password = await SharedPreferencesHelper.instance.loadData(Util.userPasswordKey);
    try {
      // final result = await LoginService.instance.refreshToken(email, password);
      // return result;
      // if (user != null) {
      //   final result = await UserService.instance.authUser(user.usuario, user.senha, true);
      //   return result;
      // }
    } catch (e) {
      //
    }
    return false;
  }

  String _normalizeMsg(String msg) {
    if(msg == '' || msg.isEmpty) return msg;
    return msg.replaceAll('"', '').replaceAll('<br/>', '').replaceAll('<br />', '').replaceAll('<br', '').replaceAll('>', '').replaceAll(';', ' ').trim();
  }
}