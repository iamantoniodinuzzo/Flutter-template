import 'dart:developer';
import 'package:flutter_template_mobile/DATA/LOCAL/ENTITIES/TODO_ITEM_ENTITY/todo_item_entity.dart';
import 'package:flutter_template_mobile/DATA/LOCAL/ENTITIES/box_names.dart';
import 'package:hive/hive.dart';

class TodoService {
  final HiveInterface hive;

  TodoService({required this.hive});

  Future<void> addItem(TodoItemEntity todoItemEntity) async {
    try {
      final todoBox = await _openBox(BoxNames.todo);
      await todoBox.add(todoItemEntity);
    } catch (e) {
      log('Errore durante l\'aggiunta di un elemento: $e');
      rethrow;
    }
  }

  Future<List<TodoItemEntity>> getAllTodos() async {
    try {
      final todoBox = await _openBox(BoxNames.todo);
      return todoBox.values.toList();
    } catch (e) {
      log('Errore durante la lettura degli elementi: $e');
      rethrow;
    }
  }

  Future<void> deleteTodo(int index) async {
    try {
      final todoBox = await _openBox(BoxNames.todo);
      await todoBox.deleteAt(index);
    } catch (e) {
      log('Errore durante la cancellazione di un elemento: $e');
      rethrow;
    }
  }

  Future<Box<TodoItemEntity>> _openBox(String type) async {
    try {
      final box = await hive.openBox<TodoItemEntity>(type);
      return box;
    } catch (e) {
      log('Errore durante l\'apertura del box: $e');
      rethrow;
    }
  }
}
