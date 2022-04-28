import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager extends Interceptor {
  static final TokenManager _instance = TokenManager._internal();
  static TokenManager get instance => _instance;
  TokenManager._internal();

  String _token;

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode == 200) {
      var data = response.data;
      if (data['token'] != null) {
        saveToken(
          data['token'],
        );
      }
    } else if (response.statusCode == 401) {
      clearToken();
    }
    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['token'] = _token;
    return super.onRequest(options, handler);
  }

  Future<void> initToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
  }

  void saveToken(String newToken) async {
    debugPrint('new Token $newToken');
    if (_token != newToken) {
      _token = newToken;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _token);
    }
  }

  void clearToken() async {
    _token = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
