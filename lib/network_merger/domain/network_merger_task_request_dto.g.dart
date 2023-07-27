// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_merger_task_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkMergerTaskRequestDto _$NetworkMergerTaskRequestDtoFromJson(
        Map<String, dynamic> json) =>
    NetworkMergerTaskRequestDto(
      task: NetworkMergerTaskDto.fromJson(
          json['element'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkMergerTaskRequestDtoToJson(
        NetworkMergerTaskRequestDto instance) =>
    <String, dynamic>{
      'element': instance.task.toJson(),
    };
