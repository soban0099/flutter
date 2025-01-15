import 'dart:convert';

import 'package:get/get.dart';

// import '../../../../app/services/local_storage.dart';
import '../network/api_endpoint.dart';
import '../network/api_provider.dart';
import '../network/api_request_representable.dart';

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;

  // String? accessToken =  Get.find<LocalStorageService>().token ?? '';

  AuthAPI.getTrendingRepo()
      : this._(
          type: AuthType.trendingRepo,
        );

  AuthAPI._({
    required this.type,
  });

  @override
  get body {
    switch (type) {
      // case AuthType.trendingRepo:
      //   return {
      //     "":
      //   };
      default:
        return "";
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String> get headers {
    switch (type) {
      // case AuthType.trendingRepo:
      //   return {
      //     'Authorization': 'Bearer $accessToken',
      //     'Content-Type': 'application/json'
      //   };

      default:
        return {};
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AuthType.trendingRepo:
        return HTTPMethod.get;
      default:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (type) {
      case AuthType.trendingRepo:
        return APIEndpoint.trendingUrl;

      default:
        return "";
    }
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, dynamic>? get urlParams {
    switch (type) {
      case AuthType.trendingRepo:
        return {
          'q': 'stars:>1000',
          'sort': 'stars',
          'order': 'desc',
        };
      default:
        return {};
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }
}

enum AuthType {
  trendingRepo,
}
