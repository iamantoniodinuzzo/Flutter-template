// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoItemEntityAdapter extends TypeAdapter<TodoItemEntity> {
  @override
  final int typeId = 1;

  @override
  TodoItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoItemEntity(
      fields[0] as String,
      fields[1] == null ? false : fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoItemEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
