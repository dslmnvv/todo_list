// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskFreezed _$$_TaskFreezedFromJson(Map<String, dynamic> json) =>
    _$_TaskFreezed(
      id: json['id'] as String,
      text: json['text'] as String,
      importance: $enumDecode(_$PriorityEnumMap, json['importance']),
      deadline: _$JsonConverterFromJson<int, DateTime>(
          json['deadline'], const EpochDateTimeConverter().fromJson),
      done: json['done'] as bool? ?? false,
      changeAt:
          const EpochDateTimeConverter().fromJson(json['changed_at'] as int),
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['created_at'], const EpochDateTimeConverter().fromJson),
      lastUpdateBy: json['last_updated_by'] as String,
    );

Map<String, dynamic> _$$_TaskFreezedToJson(_$_TaskFreezed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': _$PriorityEnumMap[instance.importance]!,
      'deadline': _$JsonConverterToJson<int, DateTime>(
          instance.deadline, const EpochDateTimeConverter().toJson),
      'done': instance.done,
      'changed_at': const EpochDateTimeConverter().toJson(instance.changeAt),
      'created_at': _$JsonConverterToJson<int, DateTime>(
          instance.createdAt, const EpochDateTimeConverter().toJson),
      'last_updated_by': instance.lastUpdateBy,
    };

const _$PriorityEnumMap = {
  Priority.basic: 'basic',
  Priority.low: 'low',
  Priority.important: 'important',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
