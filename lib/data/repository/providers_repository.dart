import 'package:testpractice/data/datasource/web_services/provider_web_services.dart';
import 'package:testpractice/data/datasource/web_services/web_services.dart';
import 'package:testpractice/data/model/provider_model.dart';

class ProvidersRepository {
  final ProviderWebServices providerWebServices;

  ProvidersRepository(this.providerWebServices);

  Future<List<Data>> getAllProviders() async {
    final List<Map<String, dynamic>> providers = await providerWebServices.getAllProviders();
    return List<Data>.from(providers.map((e) => Data.fromJson(e)));
  }
}
