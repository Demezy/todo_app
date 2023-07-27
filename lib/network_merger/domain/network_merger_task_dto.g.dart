// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_merger_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkMergerTaskDto _$NetworkMergerTaskDtoFromJson(
        Map<String, dynamic> json) =>
    NetworkMergerTaskDto(
      id: json['id'] as String,
      text: json['text'] as String,
      importance: json['importance'] as String,
      deadline: json['deadline'] as int?,
      done: json['done'] as bool,
      color: json['color'] as String?,
      createdAt: json['created_at'] as int,
      changedAt: json['changed_at'] as int,
      lastUpdatedBy: json['last_updated_by'] as String,
    );

Map<String, dynamic> _$NetworkMergerTaskDtoToJson(
    NetworkMergerTaskDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'text': instance.text,
    'importance': instance.importance,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deadline', instance.deadline);
  val['done'] = instance.done;
  writeNotNull('color', instance.color);
  val['created_at'] = instance.createdAt;
  val['changed_at'] = instance.changedAt;
  val['last_updated_by'] = instance.lastUpdatedBy;
  return val;
}
