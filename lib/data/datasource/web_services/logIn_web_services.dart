import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testpractice/core/services/shared_preferences.dart';
import 'package:testpractice/core/utils/app_strings.dart';
import 'package:testpractice/data/datasource/web_services/web_services.dart';

class LogInWebServices {
  final WebServices webServices;

  LogInWebServices(this.webServices);
  Future<Response> logIn(String email,String pass) async {
      final Response response =
      await webServices.dio.post(AppStrings.loginEndPoint,data: {
      'email': email,
      'password': pass

      });
      SharedPreferencesService.getInstance().then((service) {
        service.saveValue('token', response.data['data']['_token']);
      });
      debugPrint('response is $response');

      return response;

  }

}