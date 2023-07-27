import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todo_app/local_storage/data/local_storage_provider.dart';
import 'package:todo_app/network/domain/network_repository.dart';
import 'package:todo_app/network_merger/data/network_tasks_repository_merger.dart';
import 'package:todo_app/shared/data/config_providers.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

/// Network logic is isolated from the rest of the app. But Dio is freely used
/// across the network layer.
final dioProvider = Provider<Dio>(
  (ref) {
    final appConfig = ref.watch(appConfigProvider);
    final dio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        connectTimeout: appConfig.connectTimeout,
        receiveTimeout: appConfig.receiveTimeout,
        headers: <String, String>{
          /// token should include 'Bearer' or 'OAuth' prefix
          'Authorization': appConfig.authToken,
        },
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );
    // dio.interceptors.add(DioInterceptToCurl());
    return dio;
  },
);

final networkTasksRepositoryProvider =
    FutureProvider<NetworkRepository<TaskEntry>>(
  (ref) async {
    final dio = ref.watch(dioProvider);
    final settings = ref.watch(localStorageProvider).settings();

    return NetworkTasksRepositoryMerger(
      dio: dio,
      lastKnownRevision: await settings.lastKnownRevision(),
      saveRevision: (revision) async {
        await settings.saveLastKnownRevision(revision);
      },
    );
  },
);
