import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/network/domain/network_repository.dart';
import 'package:todo_app/network_merger/domain/network_merger_list_request_dto.dart';
import 'package:todo_app/network_merger/domain/network_merger_list_response_dto.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_dto.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_request_dto.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_response_dto.dart';
import 'package:todo_app/tasks_service/domain/task_entry.dart';

typedef _Json = Map<String, dynamic>;

/// Class implements [NetworkRepository] interface and uses [Dio] to communicate with server.
/// Server is responsible for syncronization and revision management. Merge conflict are resolved by server.
class NetworkTasksRepositoryMerger implements NetworkRepository<TaskEntry> {
  final Dio dio;

  /// Value notifier is used to track revision changes. It is also easy to log changes.
  ValueNotifier<int> revision;

  /// Callback to save revision to local storage or any other place
  void Function(int) saveRevision;

  NetworkTasksRepositoryMerger({
    required this.dio,
    required this.saveRevision,
    int? lastKnownRevision,
  }) : revision = ValueNotifier(lastKnownRevision ?? 0) {
    revision.addListener(() {
      saveRevision(revision.value);
    });
  }

  @override
  Future<void> clearItems() async {
    /// since I need correct revision and server api constructed in way that only possible to get revision
    /// is to get list of items, we spent extra traffic just for one number
    final response = await dio.get<_Json>('/list', options: _revisionHeader());
    final parsedResponse = NetworkMergerListResponseDto.fromJson(
      response.data!,
    );
    revision.value = parsedResponse.revision;
    await patch([]);
  }

  @override
  Future<bool> deleteOne(TaskEntry item) async {
    final response = await dio.delete<_Json>(
      '/list/${item.id}',
      options: _revisionHeader(),
    );

    return response.statusCode == 200;
  }

  @override
  Future<List<TaskEntry>> getAllItems() async {
    final response = await dio.get<_Json>('/list', options: _revisionHeader());
    final parsedResponse = NetworkMergerListResponseDto.fromJson(
      response.data!,
    );
    revision.value = parsedResponse.revision;
    return parsedResponse.list.map<TaskEntry>((e) => e.toTaskEntry()).toList();
  }

  @override
  Future<void> updateOne(TaskEntry item) async {
    final response = await dio.put<_Json>(
      '/list/${item.id}',
      options: _revisionHeader(),
      data: _taskRequestDto(item),
    );
    final parsedResponse = NetworkMergerTaskResponseDto.fromJson(
      response.data!,
    );
    revision.value = parsedResponse.revision;
  }

  @override
  Future<void> createOne(TaskEntry item) async {
    final response = await dio.post<_Json>(
      '/list',
      options: _revisionHeader(),
      data: _taskRequestDto(item),
    );
    final parsedResponse = NetworkMergerTaskResponseDto.fromJson(
      response.data!,
    );
    revision.value = parsedResponse.revision;
  }

  @override
  Future<List<TaskEntry>> patch(List<TaskEntry> items) async {
    final response = await dio.patch<_Json>(
      '/list',
      options: _revisionHeader(),
      data: NetworkMergerListRequestDto(
        list: items.map(NetworkMergerTaskDto.fromTaskEntry).toList(),
      ).toJson(),
    );
    final parsedResponse = NetworkMergerListResponseDto.fromJson(
      response.data!,
    );
    revision.value = parsedResponse.revision;
    return parsedResponse.list.map((taskDto) => taskDto.toTaskEntry()).toList();
  }

  Options _revisionHeader() {
    return Options(
      headers: <String, String>{
        /// This sting is strongly belongs to the server implementation, so moving it to app config is pointless,
        /// since app is independent from server
        'X-Last-Known-Revision': revision.value.toString(),
      },
    );
  }

  _Json _taskRequestDto(TaskEntry taskEntry) {
    return NetworkMergerTaskRequestDto(
      task: NetworkMergerTaskDto.fromTaskEntry(taskEntry),
    ).toJson();
  }
}
