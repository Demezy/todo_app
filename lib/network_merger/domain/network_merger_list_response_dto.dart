import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_dto.dart';

part 'network_merger_list_response_dto.g.dart';

@JsonSerializable()
class NetworkMergerListResponseDto {
  final String status;
  final List<NetworkMergerTaskDto> list;
  final int revision;

  NetworkMergerListResponseDto({
    required this.status,
    required this.list,
    required this.revision,
  });

  factory NetworkMergerListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NetworkMergerListResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkMergerListResponseDtoToJson(this);
}
