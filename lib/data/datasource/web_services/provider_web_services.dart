import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testpractice/core/utils/app_strings.dart';
import 'package:testpractice/data/datasource/web_services/web_services.dart';
import 'package:testpractice/data/model/provider_model.dart';

class ProviderWebServices {
  final WebServices webServices;

  ProviderWebServices(this.webServices);

  Future<List<Map<String, dynamic>>> getAllProviders() async {
    try {
      List<Map<String, dynamic>> allProviders = [];

      final Response response =
          await webServices.dio.get(AppStrings.providerEndPoint);
      allProviders.addAll(
          List<Map<String, dynamic>>.from(response.data["data"]));
      debugPrint('response is $response');

      return allProviders;
    } catch (e) {
      debugPrint('error is $e');
      return [];
    }
  }

  Future<List<Data>> getAllProvidersWithToken(String token) async {
    try {
      Response response = await webServices.dio.get(
          AppStrings.providerWithTokenEndPoint,
          queryParameters: {'Authorization': token});
      debugPrint('response is $response');

      return response.data;
    } catch (e) {
      debugPrint('error is $e');
      return [];
    }
  }
}
