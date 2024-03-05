import 'package:flutter_template_mobile/DATA/LOCAL/ENTITIES/TODO_ITEM_ENTITY/todo_item_entity.dart';
import 'package:flutter_template_mobile/DOMAIN/MODELS/todo_model.dart';

extension TodoModelToEntity on TodoItemModel {
  TodoItemEntity toEntity() {
    return TodoItemEntity(title, isCompleted);
  }
}
