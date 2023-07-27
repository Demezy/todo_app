import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_dto.dart';

part 'network_merger_task_request_dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class NetworkMergerTaskRequestDto {
  @JsonKey(name: 'element')
  final NetworkMergerTaskDto task;

  NetworkMergerTaskRequestDto({required this.task});

  factory NetworkMergerTaskRequestDto.fromJson(Map<String, dynamic> json) =>
      _$NetworkMergerTaskRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkMergerTaskRequestDtoToJson(this);
}
