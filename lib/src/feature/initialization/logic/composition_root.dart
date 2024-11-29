import 'package:flutter_starter/src/core/components/rest_client/rest_client.dart';
import 'package:flutter_starter/src/core/components/rest_client/src/dio/rest_client_dio_base.dart';
import 'package:flutter_starter/src/core/database/drift/database.dart';
import 'package:flutter_starter/src/core/utils/logger/logger.dart';
import 'package:flutter_starter/src/feature/auth/data/data_provider/token_storage_sp.dart';
import 'package:flutter_starter/src/feature/initialization/model/dependencies.dart';
import 'package:flutter_starter/src/feature/settings/bloc/settings_bloc.dart';
import 'package:flutter_starter/src/feature/settings/data/locale_datasource.dart';
import 'package:flutter_starter/src/feature/settings/data/locale_repository.dart';
import 'package:flutter_starter/src/feature/settings/data/text_scale_datasource.dart';
import 'package:flutter_starter/src/feature/settings/data/text_scale_repository.dart';
import 'package:flutter_starter/src/feature/settings/data/theme_datasource.dart';
import 'package:flutter_starter/src/feature/settings/data/theme_mode_codec.dart';
import 'package:flutter_starter/src/feature/settings/data/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class CompositionRoot {
  const CompositionRoot();

  Future<CompositionResult> compose() async {
    final stopwatch = Stopwatch()..start();

    Logger.info('Initializing dependencies...');
    final dependencies = await _initDependencies();
    Logger.info('Dependencies initialized');

    stopwatch.stop();
    final result = CompositionResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    return result;
  }

  Future<Dependencies> _initDependencies() async {
    final database = AppDatabase();
    final sharedPreferences = await SharedPreferences.getInstance();
    final storage = TokenStorageSP(sharedPreferences: sharedPreferences);

    final dioBase = RestClientDioBase(tokenStorage: storage);
    final client = RestClientDio(
      baseUrl: RestClientDioBase.baseUrl,
      dio: dioBase.dio,
    );

    final settingsBloc = _initSettingsBloc(sharedPreferences);
    final token = await storage.load();

    dioBase.token = token?.accessToken;

    /// example of how to initialize the user
    // final authRepository = AuthRepositoryImpl(
    //   dataSource: AuthDataSourceNetwork(client: client),
    //   storage: storage,
    //   profileDataSource: ProfileDataSourceNetwork(restClient: client),
    //   restClientDioBase: dioBase,
    // );
    //
    // final profileRepository = ProfileRepositoryImpl(
    //   profileDataSource: ProfileDataSourceNetwork(restClient: client),
    // );
    //
    // UserEntity user = UserEntity.notAuthenticated();
    // if (token != null) {
    //   try {
    //     user = await profileRepository.getProfile();
    //   } catch (e, st) {
    //     storage.clear();
    //     Logger.error('Failed to get user profile', e, st);
    //   }
    // }

    // final authBloc = AuthBloc(
    //   AuthState.idle(user: user),
    //   authRepository: authRepository,
    // );

    // final connectionChecker = ConnectionCheckerCubit/Bloc();

    return Dependencies(
      // authBloc: authBloc,
      settingsBloc: settingsBloc,
      sharedPreferences: sharedPreferences,
      // connectionCheckerCubit: connectionCheckerCubit,
    );
  }

  SettingsBloc _initSettingsBloc(SharedPreferences prefs) {
    final localeRepository = LocaleRepositoryImpl(
      localeDataSource: LocaleDataSourceLocal(sharedPreferences: prefs),
    );

    final themeRepository = ThemeRepositoryImpl(
      themeDataSource: ThemeDataSourceLocal(
        sharedPreferences: prefs,
        codec: const ThemeModeCodec(),
      ),
    );

    final textScaleRepository = TextScaleRepositoryImpl(
      textScaleDataSource: TextScaleDatasourceLocal(sharedPreferences: prefs),
    );

    final localeFuture = localeRepository.getLocale();
    final theme = themeRepository.getTheme();
    final locale = localeFuture;
    final textScale = textScaleRepository.getScale();

    final initialState = SettingsState.idle(
      appTheme: theme,
      locale: locale,
      textScale: textScale,
    );

    final settingsBloc = SettingsBloc(
      localeRepository: localeRepository,
      themeRepository: themeRepository,
      textScaleRepository: textScaleRepository,
      initialState: initialState,
    );
    return settingsBloc;
  }
}
