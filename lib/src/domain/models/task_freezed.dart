import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_freezed.freezed.dart';
part 'task_freezed.g.dart';

class EpochDateTimeConverter implements JsonConverter<DateTime, int> {
  const EpochDateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

class JsonStringToInt implements JsonConverter<int, dynamic> {
  const JsonStringToInt();

  @override
  int fromJson(dynamic json) {
    if (json is num) {
      return json.toInt();
    }
    return int.tryParse(json) ?? 0;
  }

  @override
  String toJson(int object) => object.toString();
}
enum Priority {
  basic('Нет'),
  low('Низкий'),
  important('Высокий');

  final String nameField;
  const Priority(this.nameField);

  factory Priority.fromNameField(String name) {

    switch (name) {
      case  'Низкий':
        {
          return Priority.low;
        }
      case 'Высокий':
        {
          return Priority.important;
        }
      default:
        {
          return Priority.basic;
        }
    }
  }
}

@Freezed()
class TaskFreezed with _$TaskFreezed{
  factory TaskFreezed({
    required String id,
    required String text,
    required Priority importance,
    @EpochDateTimeConverter()
    DateTime? deadline,
    @Default(false) bool done,

    @EpochDateTimeConverter()
    @JsonKey(
        name: 'changed_at',
    ) required DateTime changeAt,

    @EpochDateTimeConverter()
    @JsonKey(
      name: 'created_at',
    ) required DateTime? createdAt,
    @JsonKey(name: 'last_updated_by') required String lastUpdateBy,
  }) = _TaskFreezed;

  const TaskFreezed._();

  factory TaskFreezed.fromJson(Map<String, Object?> json)
  => _$TaskFreezedFromJson(json);

  factory TaskFreezed.empty({required String id, required String deviceId}) {
    return TaskFreezed(
      text: '',
      id: id,
      lastUpdateBy: deviceId,
      done: false,
      changeAt: DateTime.now(),
      createdAt: DateTime.now(),
      importance: Priority.basic,
    );
  }

  factory TaskFreezed.fromSql(Map<String, dynamic> json){
    return TaskFreezed(
      id: json["uuid"],
      text: json["description"],
      lastUpdateBy: json["last_updated_by"],
      importance: Priority.values.byName(json["importance"]),
      deadline:  (json["deadline"] != null)
          ? DateTime.parse(json["deadline"])
          : null,
      changeAt: DateTime.parse(json["changed_at"]),
      createdAt: DateTime.parse(json["created_at"]),
      done: (json["done"] == 1) ? true : false,
    );
  }

   Map<String, dynamic> toSQLRequest() {
    return {
      "uuid": id,
      "description": text,
      "last_updated_by": lastUpdateBy,
      "importance": importance.name,
      "deadline": deadline?.toIso8601String(),
      "changed_at": changeAt.toIso8601String(),
      "created_at": createdAt?.toIso8601String(),
      "done": (done) ? 1 : 0,
    };
  }



}