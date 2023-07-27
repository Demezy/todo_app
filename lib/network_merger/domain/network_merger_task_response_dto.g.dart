// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_merger_task_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkMergerTaskResponseDto _$NetworkMergerTaskResponseDtoFromJson(
        Map<String, dynamic> json) =>
    NetworkMergerTaskResponseDto(
      status: json['status'] as String,
      task: NetworkMergerTaskDto.fromJson(
          json['element'] as Map<String, dynamic>),
      revision: json['revision'] as int,
    );

Map<String, dynamic> _$NetworkMergerTaskResponseDtoToJson(
        NetworkMergerTaskResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'element': instance.task.toJson(),
      'revision': instance.revision,
    };
