import 'dart:convert';

class TodoItem {
  final int? id;
  final String title;
  final String description;
  final bool isDone;
  TodoItem({
    this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoItem.fromJson(String source) => TodoItem.fromMap(json.decode(source));

  TodoItem copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() {
    return 'TodoItem(id: $id, title: $title, description: $description, isDone: $isDone)';
  }
}
