import 'package:hive_flutter/hive_flutter.dart';

part 'todo_item_entity.g.dart';

@HiveType(typeId: 1)
class TodoItemEntity {
  @HiveField(0)
  final String title;
  @HiveField(1, defaultValue: false)
  final bool isCompleted;

  TodoItemEntity(this.title, this.isCompleted);
}
