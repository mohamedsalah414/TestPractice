import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;


void initGetIt() {
  // getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  // getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  // getIt.registerLazySingleton<WebServices>(
  //         () => WebServices(createAndSetupDio()));
}

