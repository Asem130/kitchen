import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kitchen/app/shared_prefs.dart';
import 'package:kitchen/data/data_source/remote_data_source.dart';
import 'package:kitchen/data/network/app_api.dart';
import 'package:kitchen/data/network/dio_factory.dart';
import 'package:kitchen/data/network/network_info.dart';
import 'package:kitchen/data/repository/repository_impl.dart';
import 'package:kitchen/domain/repository/repository.dart';
import 'package:kitchen/domain/usecase/login_usecase.dart';
import 'package:kitchen/presentation/login/viewmodel/login_viewmode.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton(() => sharedPreferences);

  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));

  instance.registerLazySingleton<NetworkInfoImpl>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  instance.registerLazySingleton<Repository>(
      () => RepositortImpl(instance(), instance()));
}

Future<void> initLoginModule() async {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
