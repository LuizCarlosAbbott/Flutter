import 'package:moor_flutter/moor_flutter.dart';

part 'my_database.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descripition => text().withLength(min: 3, max: 50)();
  BoolColumn get completed => boolean()();
}

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idTodo => integer()();
}

@UseMoor(tables: [Todos, Favorites])
class MyDatabase extends _$MyDatabase {
  static final MyDatabase instance = MyDatabase._internal();

  MyDatabase._internal()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  Stream<List<Todo>> getAllTodos() {
    return select(todos).watch();
  }

  Future addTodo(Todo todo) {
    return into(todos).insert(todo);
  }

  Future deleteTodo(int id) {
    return (delete(todos)..where((todo) => todo.id.equals(id))).go();
  }

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
}
