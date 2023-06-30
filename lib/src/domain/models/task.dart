import 'package:todo_list/src/const/api/device.dart';

import '../../_common/log_handler.dart';

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

class Task {
  String id;
  String text;
  String lastUpdateBy;
  Priority importance;
  DateTime? deadline;
  DateTime changeAt;
  DateTime createdAt;
  bool done;

  Task({
    required this.id,
    required this.text,
    required this.importance,
    this.deadline,
    this.done = false,
    required this.changeAt,
    required this.createdAt,
    required this.lastUpdateBy,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    Log.i('$json');
    return Task(
      id: json["id"],
      text: json["text"],
      lastUpdateBy: json["last_updated_by"],
      importance: Priority.values.byName(json["importance"]),
      deadline:  (json["deadline"] != null)
          ? DateTime.fromMicrosecondsSinceEpoch(json["deadline"])
          : null,
      changeAt: DateTime.fromMicrosecondsSinceEpoch(json["changed_at"]),
      createdAt: DateTime.fromMicrosecondsSinceEpoch(json["created_at"]),
      done: json["done"].toString().toLowerCase() == 'true',
    );
  }

  factory Task.fromSql(Map<String, dynamic> json) {
    Log.i('$json');
    return Task(
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


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "text": text,
      "last_updated_by": lastUpdateBy,
      "importance": importance.name,
      "deadline": deadline?.microsecondsSinceEpoch,
      "changed_at": changeAt.microsecondsSinceEpoch,
      "created_at": createdAt.microsecondsSinceEpoch,
      "done": done,
    };
  }

  Map<String, dynamic> toSQLRequest() {
    return {
      "uuid": id,
      "description": text,
      "last_updated_by": lastUpdateBy,
      "importance": importance.name,
      "deadline": deadline?.toIso8601String(),
      "changed_at": changeAt.toIso8601String(),
      "created_at": createdAt.toIso8601String(),
      "done": (done) ? 1 : 0,
    };
  }

  factory Task.empty({required String id}) {
    return Task(
      text: '',
      id: id,
      lastUpdateBy: DeviceInfo.id,
      done: false,
      changeAt: DateTime.now(),
      createdAt: DateTime.now(),
      importance: Priority.basic,
    );
  }

  @override
  String toString() {
    return 'Task{\n'
        'id: $id, \n'
        'text: $text, \n'
        'lastUpdateBy: $lastUpdateBy, \n'
        'importance: ${importance.name}, \n'
        'deadline: $deadline, \n'
        'changeAt: $changeAt, \n'
        'createdAt: $createdAt, \n'
        'done: $done \n'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          lastUpdateBy == other.lastUpdateBy &&
          importance == other.importance &&
          deadline == other.deadline &&
          changeAt == other.changeAt &&
          createdAt == other.createdAt &&
          done == other.done;

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      lastUpdateBy.hashCode ^
      importance.hashCode ^
      deadline.hashCode ^
      changeAt.hashCode ^
      createdAt.hashCode ^
      done.hashCode;


}
