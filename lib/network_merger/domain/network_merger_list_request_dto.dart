import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_dto.dart';

part 'network_merger_list_request_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class NetworkMergerListRequestDto {
  final List<NetworkMergerTaskDto> list;
  final String status;

  const NetworkMergerListRequestDto({
    required this.list,
    this.status = 'ok',
  });

  factory NetworkMergerListRequestDto.fromJson(Map<String, dynamic> json) =>
      _$NetworkMergerListRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkMergerListRequestDtoToJson(this);
}
