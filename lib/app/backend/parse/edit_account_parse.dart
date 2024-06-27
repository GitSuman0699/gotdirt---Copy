import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';
import 'package:gotdirt/app/util/constant.dart';
import 'package:gotdirt/app/util/string.dart';

class EditAccountParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  EditAccountParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getRelationalResult(dynamic param) async {
    return await apiService.postPublic(AppConstants.userById, param);
  }

  Future<Response> updateProfile(dynamic param) async {
    debugPrint(param.toString());
    return await apiService.postPublic(AppConstants.updateUser, param);
  }

  String getUID() {
    return sharedPreferencesManager.getString(StringText.userId) ?? '0';
  }

  Future<Response> uploadImage(dynamic param) async {
    return await apiService.postPublic(AppConstants.uploadImage, param);
  }
}
