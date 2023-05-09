import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpractice/data/datasource/web_services/provider_web_services.dart';
import 'package:testpractice/data/datasource/web_services/web_services.dart';
import 'package:testpractice/data/model/provider_model.dart';

import '../../../data/repository/providers_repository.dart';

final homeScreenProviders = FutureProvider<List<Data>>((ref) async {
  final providersRiverPod = HomeScreenProvidersRiverPod(ProvidersRepository(ProviderWebServices(WebServices())));
  final data = await providersRiverPod.getAllProviders();
  return data;
});

class HomeScreenProvidersRiverPod  {
  final ProvidersRepository providersRepository;

  HomeScreenProvidersRiverPod(this.providersRepository);


  Future<List<Data>> getAllProviders() async {
    return providersRepository.getAllProviders();
  }
}
