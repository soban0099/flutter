import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalStorageService extends GetxService {
  // static SharedPreferences? _sharedPreferences;

  // void clear() {
  //   _sharedPreferences!.clear();
  // }

  // String? get token {
  //   final rawJson = _sharedPreferences?.getString(_Key.token.toString());
  //   if (rawJson == null) {
  //     return null;
  //   }
  //   return rawJson;
  // }

  // set token(String? value) {
  //   if (value != null) {
  //     _sharedPreferences?.setString(_Key.token.toString(), value);
  //   } else {
  //     _sharedPreferences?.remove(_Key.token.toString());
  //   }
  // }
}

enum _Key {
  token,
}
