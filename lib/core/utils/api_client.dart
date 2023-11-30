import 'dart:convert';

import 'package:get/get.dart';
import 'package:restro_book/core/utils/exports.dart';

class ApiClient extends GetConnect implements GetxService {
  String? token;
  late Map<String, String> _mainHeaders;

  ApiClient() {
    timeout = const Duration(seconds: 20);
    _mainHeaders = {
      'Context-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token ?? ''}',
    };
  }

  String _buildUrl(String partialUrl) {
    final baseUrl = Urls.baseUrl;
    return baseUrl + partialUrl;
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Context-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      final completeUrl = _buildUrl(uri);
      Response response = await get(Uri.encodeFull(completeUrl),
          headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      final completeUrl = _buildUrl(uri);
      print('full urls: $completeUrl');
      Response response =
          await post(completeUrl, jsonEncode(body), headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(String uri, dynamic body) async {
    try {
      final completeUrl = _buildUrl(uri);
      Response response =
          await put(uri, jsonEncode(completeUrl), headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> patchData(String uri, dynamic body) async {
    try {
      final completeUrl = _buildUrl(uri);
      Response response =
          await patch(completeUrl, jsonEncode(body), headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
