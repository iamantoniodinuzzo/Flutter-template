import 'package:flutter_template_mobile/DATA/LOCAL/ENTITIES/TODO_ITEM_ENTITY/todo_item_entity.dart';
import 'package:flutter_template_mobile/DATA/LOCAL/SERVICE/todo_service.dart';
import 'package:flutter_template_mobile/DOMAIN/LOCAL/REPOSITORY/todo_repository.dart';
import 'package:flutter_template_mobile/DATA/LOCAL/MAPPER/todo_mapper.dart';
import 'package:flutter_template_mobile/DOMAIN/MODELS/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoService todoService;

  TodoRepositoryImpl({required this.todoService});

  @override
  Future<void> addItem(TodoItemModel todoItemModel) =>
      todoService.addItem(todoItemModel.toEntity());

  @override
  Future<void> deleteTodo(int index) => todoService.deleteTodo(index);

  @override
  Future<List<TodoItemEntity>> getAllTodos() => todoService.getAllTodos();
}
