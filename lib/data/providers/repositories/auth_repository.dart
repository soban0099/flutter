import 'dart:convert';

import 'package:trendingapp/data/providers/apis/auth_api.dart';
import 'package:trendingapp/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future getTrendingRepo() async {
    try {
      final response = await AuthAPI.getTrendingRepo().request();
      final result = json.decode(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
