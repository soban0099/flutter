import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../utils/custom_snackbar.dart';
import 'api_request_representable.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;
  final _client = http.Client();

  Future<http.MultipartRequest> jsonToFormData(
      http.MultipartRequest request, Map<String, dynamic> data) async {
    for (var key in data.keys) {
      if (data[key] is List<File>) {
        // Check if the value is a list of files
        var fileList = data[key] as List<File>;
        for (var file in fileList) {
          var stream = http.ByteStream(file.openRead().cast());
          var length = await file.length();
          var multipartFile = http.MultipartFile(
            key,
            stream,
            length,
            filename: file.path,
            contentType: MediaType(
              'image',
              'jpeg',
            ), // Replace with the appropriate content type
          );
          request.files.add(multipartFile);
        }
      } else if (data[key] is File) {
        var file = data[key] as File;
        var stream = http.ByteStream(file.openRead().cast());
        var length = await file.length();
        var multipartFile = http.MultipartFile(
          key,
          stream,
          length,
          filename: file.path,
          contentType: MediaType(
            'image',
            'jpeg',
          ), // Replace with the appropriate content type
        );
        request.files.add(multipartFile);
      } else {
        request.fields[key] = data[key].toString();
      }
    }
    return request;
  }

  onUnAuthorized() async {
    
  }

  Future<dynamic> request(APIRequestRepresentable request) async {
    try {
      Uri uri = Uri.https(request.endpoint, request.path, request.urlParams);

      http.Response response;
      switch (request.method) {
        case HTTPMethod.get:
          print('api url ${request.url}');
          print('api params ${request.urlParams}');
          response = await _client.get(
            uri,
            // headers: request.headers,
          );
          log('api response ${response.body}');

          break;
        case HTTPMethod.post:
          print('api url ${request.url}');
          print('api body ${request.body}');
          response = await _client.post(uri,
              headers: request.headers, body: request.body);
          print(response.body);

          break;
        case HTTPMethod.delete:
          response = await _client.delete(
            uri,
            headers: request.headers,
          );
          break;
        case HTTPMethod.put:
          response = await _client.put(uri,
              headers: request.headers, body: request.body);
          break;
        case HTTPMethod.patch:
          response = await _client.patch(uri,
              headers: request.headers, body: request.body);
          break;
        case HTTPMethod.memberFormMethod:
          print('api url ${request.url}');
          print('api body ${request.body}');
          try {
            // Create a multipart request
            var req = http.MultipartRequest('POST', uri);

            if (request.body.isNotEmpty) {
              // Convert JSON data to form data
              final reqs = jsonToFormData(req, request.body);
              req = await reqs;
            }

            // Add request headers
            req.headers.addAll(request.headers);

            // Send the request
            final res = await req.send();

            // Read the response
            final responseBody = await res.stream.bytesToString();

            response = http.Response(responseBody, res.statusCode);
          } catch (e) {
            if (e is ArgumentError) {
              Map<String, dynamic> value = json.decode(e.invalidValue);
              // Simulate creating an HTTP response
              value["data"]["about"] = "";
              response =
                  http.Response(json.encode(value), value["status_code"]);
            } else {
              response = http.Response(
                  'Error sending request: $e', HttpStatus.internalServerError);
            }
          }
          break;
      }

      return _returnResponse(response);
    } on TimeoutException catch (_) {
      CustomSnackBar.show('No Internet connection');
      throw TimeOutException(null);
    } on SocketException {
      CustomSnackBar.show('No Internet connection');
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return utf8.decode(response.bodyBytes);
      case 201:
        return utf8.decode(response.bodyBytes);
      case 204:
        return jsonEncode({
          "status": true,
          "status_code": 200,
          "message": "Not Found",
          "data": null
        }).toString();
      case 400:
        return utf8.decode(response.bodyBytes);

      case 401:
        onUnAuthorized();

        throw UnauthorisedException("Token Unauthorized");

      case 403:
        onUnAuthorized();

        throw UnauthorisedException("Forbidden");
      case 404:
        throw BadRequestException('Not found');
      case 500:
      case 503:
        throw FetchDataException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final dynamic code;
  final dynamic message;
  final dynamic details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "$details";
  }
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class ForbiddenException extends AppException {
  ForbiddenException(String? details)
      : super(
            code: "forbidden", message: "Forbidden Request", details: details);
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}
