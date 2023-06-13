enum Priority{
  none('Нет'),
  low('Низкий'),
  high('Высокий');

  final String nameField;
  const Priority(this.nameField);


  factory Priority.fromNameField(String name){

    switch (name){
      case 'Низкий' :{
        return Priority.low;
      }
      case 'Высокий' : {
        return Priority.high;
      }
      default : {
        return Priority.none;
      }
    }
  }

}


class Task{
  String description;
  Priority? priority;
  DateTime? date;
  bool isComplete;

  Task({
    required this.description,
    this.priority,
    this.date,
    this.isComplete = false,
  });

  factory Task.empty(){
    return Task(description: '');
  }

  @override
  String toString() {
    return 'Task{description: $description, priority: $priority, date: $date, isComplete: $isComplete}';
  }
}