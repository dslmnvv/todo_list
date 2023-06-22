import '../../_common/log_handler.dart';

enum Priority {
  basic('Нет'),
  low('Низкий'),
  important('Высокий');

  final String nameField;
  const Priority(this.nameField);

  factory Priority.fromNameField(String name) {
    switch (name) {
      case 'Низкий':
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


  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "text": this.text,
      "last_updated_by": this.lastUpdateBy,
      "importance": this.importance.name,
      "deadline": this.deadline?.microsecondsSinceEpoch,
      "changed_at": this.changeAt.microsecondsSinceEpoch,
      "created_at": this.createdAt.microsecondsSinceEpoch,
      "done": this.done,
    };
  }

  factory Task.empty({required String id}) {
    return Task(
      text: '',
      id: id,
      lastUpdateBy: '',
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
}
