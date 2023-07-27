// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_merger_list_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkMergerListRequestDto _$NetworkMergerListRequestDtoFromJson(
        Map<String, dynamic> json) =>
    NetworkMergerListRequestDto(
      list: (json['list'] as List<dynamic>)
          .map((e) => NetworkMergerTaskDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String? ?? 'ok',
    );

Map<String, dynamic> _$NetworkMergerListRequestDtoToJson(
        NetworkMergerListRequestDto instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };
