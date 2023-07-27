import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/network_merger/domain/network_merger_task_dto.dart';

part 'network_merger_task_response_dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class NetworkMergerTaskResponseDto {
  final String status;
  @JsonKey(name: 'element')
  final NetworkMergerTaskDto task;
  final int revision;

  NetworkMergerTaskResponseDto({
    required this.status,
    required this.task,
    required this.revision,
  });

  factory NetworkMergerTaskResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NetworkMergerTaskResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkMergerTaskResponseDtoToJson(this);
}
