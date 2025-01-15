import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:trendingapp/data/models/repository_model.dart';
import 'package:trendingapp/data/providers/repositories/auth_repository.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  var repositories = Rxn<TrendingResponse>();
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchRepositories();
    super.onInit();
  }

  Future fetchRepositories() async {
    try {
      isLoading(true);
      final response = await AuthenticationRepositoryIml().getTrendingRepo();
      if (response['items'] != null) {
        isLoading(false);
        repositories.value = TrendingResponse.fromJson(response);
      } else {
        isLoading(false);
        Get.snackbar("Error", "Failed to fetch data");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch data");
    } finally {
      isLoading(false);
    }
  }
}
