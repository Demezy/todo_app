import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/config/app_config.dart';
import 'package:todo_app/isar_local_storage/data/local_storage_isar.dart';
import 'package:todo_app/local_storage/data/local_storage_provider.dart';
import 'package:todo_app/shared/data/config_providers.dart';

Future<List<Override>> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize local storage
  final localStorage = LocalStorageIsar();
  await localStorage.initialize();
  await dotenv.load();
  final appConfig = AppConfig(
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: Duration(
      seconds: int.parse(dotenv.env['CONNECT_TIMEOUT']!),
    ),
    receiveTimeout: Duration(
      seconds: int.parse(dotenv.env['RECEIVE_TIMEOUT']!),
    ),
    authToken: dotenv.env['AUTH_TOKEN']!,
  );
  return [
    localStorageProvider.overrideWithValue(localStorage),
    appConfigProvider.overrideWithValue(appConfig),
  ];
}
