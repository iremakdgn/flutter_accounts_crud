import 'dart:convert';
import 'dart:io';
import "dart:async";
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import '../env.dart';

class BaseApi {
  Future<String> get(String url) async {
    return http.get(
      Uri.parse(environment["apiBaseUrl"]! + url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.acceptHeader: "application/json; charset=UTF-8",
      },
    ).then((response) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body)["items"];
        if (data == null || data.toString().isEmpty) {
          return "error".tr();
        } else {
          return json.encode(data);
        }
      } else {
        return "error".tr();
      }
    });
  }

  Future<String> post(String url, dynamic obj) async {
    return http
        .post(Uri.parse(environment["apiBaseUrl"]! + url),
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
              HttpHeaders.acceptHeader: "application/json; charset=UTF-8",
            },
            body: obj != null ? json.encode(obj) : null)
        .then((response) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body)["items"];
        if (data == null || data.isEmpty) return "errorMessage".tr();
        return json.encode(data);
      }
      return "error".tr();
    });
  }

  Future<bool> put(String url, dynamic obj) async {
    return http
        .put(Uri.parse(environment["apiBaseUrl"]! + url),
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
              HttpHeaders.acceptHeader: "application/json; charset=UTF-8",
            },
            body: obj != null ? json.encode(obj) : null)
        .then((response) {
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    });
  }

  Future<bool> delete(String url) async {
    return http.delete(
      Uri.parse(environment["apiBaseUrl"]! + url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.acceptHeader: "application/json; charset=UTF-8",
      },
    ).then((response) {
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    });
  }
}
