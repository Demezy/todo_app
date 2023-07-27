// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_merger_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkMergerListResponseDto _$NetworkMergerListResponseDtoFromJson(
        Map<String, dynamic> json) =>
    NetworkMergerListResponseDto(
      status: json['status'] as String,
      list: (json['list'] as List<dynamic>)
          .map((e) => NetworkMergerTaskDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      revision: json['revision'] as int,
    );

Map<String, dynamic> _$NetworkMergerListResponseDtoToJson(
        NetworkMergerListResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'list': instance.list,
      'revision': instance.revision,
    };
