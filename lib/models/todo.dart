class Todo {
  int id;
  bool isCompleted;
  String title;
  String description;

  Todo(
      {required this.title,
      required this.description,
      required this.id,
      required this.isCompleted});
  @override
  int get hashCode => Object.hash(title, description, id);
  @override
  bool operator ==(Object other) {
    return other is Todo &&
        other.title == title &&
        other.description == description;
  }
}
