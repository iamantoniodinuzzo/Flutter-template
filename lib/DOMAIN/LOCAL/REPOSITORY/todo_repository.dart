import 'package:flutter_template_mobile/DATA/LOCAL/ENTITIES/TODO_ITEM_ENTITY/todo_item_entity.dart';
import 'package:flutter_template_mobile/DOMAIN/MODELS/todo_model.dart';

abstract class TodoRepository {
  Future<void> addItem(TodoItemModel todoItemModel);
  Future<List<TodoItemEntity>> getAllTodos();
  Future<void> deleteTodo(int index);
}
