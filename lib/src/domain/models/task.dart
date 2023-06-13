enum Priority{
  low, high
}

class Task{
  String description;
  Priority? priority;
  DateTime? date;

  Task({
    required this.description,
    this.priority,
    this.date,
  });
}