import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:pips_flutter/app/app_prefs.dart';
import 'package:pips_flutter/data/data_source/local_data_source.dart';
import 'package:pips_flutter/data/data_source/remote_data_source.dart';
import 'package:pips_flutter/data/network/app_api.dart';
import 'package:pips_flutter/data/network/dio_factory.dart';
import 'package:pips_flutter/data/network/network_info.dart';
import 'package:pips_flutter/data/repository/repository_implementer.dart';
import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/dashboard_usecase.dart';
import 'package:pips_flutter/domain/usecase/forgot_password_usecase.dart';
import 'package:pips_flutter/domain/usecase/login_usecase.dart';
import 'package:pips_flutter/domain/usecase/notifications_usecase.dart';
import 'package:pips_flutter/domain/usecase/projects_usecase.dart';
import 'package:pips_flutter/domain/usecase/search_usecase.dart';
import 'package:pips_flutter/presentation/forgot_password/forgot_password_viewmodel.dart';
import 'package:pips_flutter/presentation/login/login_viewmodel.dart';
import 'package:pips_flutter/presentation/main/home/home_viewmodel.dart';
import 'package:pips_flutter/presentation/main/notifications/notifications_viewmodel.dart';
import 'package:pips_flutter/presentation/main/projects/projects_viewmodel.dart';
import 'package:pips_flutter/presentation/main/search/search_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(DataConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementer());

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  instance.registerLazySingleton<Repository>(
      () => RepositoryImplementer(instance(), instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

initDashboardModule() {
  if (!GetIt.I.isRegistered<DashboardUseCase>()) {
    instance
        .registerFactory<DashboardUseCase>(() => DashboardUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

initNotificationsModule() {
  if (!GetIt.I.isRegistered<NotificationsUseCase>()) {
    instance.registerFactory<NotificationsUseCase>(
        () => NotificationsUseCase(instance()));
    instance.registerFactory<NotificationsViewModel>(
        () => NotificationsViewModel(instance()));
  }
}

initProjectsModule() {
  if (!GetIt.I.isRegistered<ProjectsUseCase>()) {
    instance
        .registerFactory<ProjectsUseCase>(() => ProjectsUseCase(instance()));
    instance.registerFactory<ProjectsViewModel>(
        () => ProjectsViewModel(instance()));
  }
}

initSearchModule() {
  if (!GetIt.I.isRegistered<SearchUseCase>()) {
    instance.registerFactory<SearchUseCase>(() => SearchUseCase(instance()));
    instance
        .registerFactory<SearchViewModel>(() => SearchViewModel(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initProjectsModule();
  initNotificationsModule();
  initDashboardModule();
  initForgotPasswordModule();
  initSearchModule();
}
