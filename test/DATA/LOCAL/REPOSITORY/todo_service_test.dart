import 'package:flutter_template_mobile/DATA/LOCAL/ENTITIES/TODO_ITEM_ENTITY/todo_item_entity.dart';
import 'package:flutter_template_mobile/DATA/LOCAL/ENTITIES/box_names.dart';
import 'package:flutter_template_mobile/DATA/LOCAL/SERVICE/todo_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hive/hive.dart'; // Assicurati di importare Hive

class MockHiveInterface extends Mock implements HiveInterface {}

class MockBox extends Mock implements Box<TodoItemEntity> {}

///[StackOverflow example](https://stackoverflow.com/questions/62332566/how-can-i-test-mock-hive-flutter-open-box-logic-in-repo)
void main() {
  group('TodoService Tests', () {
    late TodoService todoService;
    late MockHiveInterface mockHiveInterface;
    late MockBox mockBox;

    setUp(() {
      mockHiveInterface = MockHiveInterface();
      mockBox = MockBox();
      todoService = TodoService(hive: mockHiveInterface);
    });

    test('addItem should add TodoItemEntity to the box', () async {
      final todoItem = TodoItemEntity('Test Todo', false);

      when(() => mockHiveInterface.openBox<TodoItemEntity>(BoxNames.todo))
          .thenAnswer((_) async => mockBox);
      when(() => mockBox.add(todoItem)).thenAnswer((_) async => 1);

      await todoService.addItem(todoItem);

      verify(() => mockBox.add(todoItem)).called(1);
    });

    test('getAllTodos should return a list of TodoItemEntity', () async {
      final todoList = [
        TodoItemEntity('Todo 1', false),
        TodoItemEntity('Todo 2', true),
      ];

      when(() => mockHiveInterface.openBox<TodoItemEntity>(BoxNames.todo))
          .thenAnswer((_) async => mockBox);
      when(() => mockBox.values).thenReturn(todoList);

      final result = await todoService.getAllTodos();

      expect(result, equals(todoList));
    });

    test('deleteTodo should delete TodoItemEntity at given index', () async {
      const index = 1;

      when(() => mockHiveInterface.openBox<TodoItemEntity>(BoxNames.todo))
          .thenAnswer((_) async => mockBox);
      when(() => mockBox.deleteAt(index)).thenAnswer((_) async {});

      await todoService.deleteTodo(index);

      verify(() => mockBox.deleteAt(index)).called(1);
    });
  });
}
