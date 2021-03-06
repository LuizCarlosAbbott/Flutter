// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String descripition;
  final bool completed;
  Todo(
      {@required this.id,
      @required this.descripition,
      @required this.completed});
  factory Todo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Todo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      descripition: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descripition']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
    );
  }
  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      descripition: serializer.fromJson<String>(json['descripition']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'descripition': serializer.toJson<String>(descripition),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Todo>>(bool nullToAbsent) {
    return TodosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      descripition: descripition == null && nullToAbsent
          ? const Value.absent()
          : Value(descripition),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
    ) as T;
  }

  Todo copyWith({int id, String descripition, bool completed}) => Todo(
        id: id ?? this.id,
        descripition: descripition ?? this.descripition,
        completed: completed ?? this.completed,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('descripition: $descripition, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(descripition.hashCode, completed.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == id &&
          other.descripition == descripition &&
          other.completed == completed);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> descripition;
  final Value<bool> completed;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.descripition = const Value.absent(),
    this.completed = const Value.absent(),
  });
  TodosCompanion copyWith(
      {Value<int> id, Value<String> descripition, Value<bool> completed}) {
    return TodosCompanion(
      id: id ?? this.id,
      descripition: descripition ?? this.descripition,
      completed: completed ?? this.completed,
    );
  }
}

class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  final GeneratedDatabase _db;
  final String _alias;
  $TodosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descripitionMeta =
      const VerificationMeta('descripition');
  GeneratedTextColumn _descripition;
  @override
  GeneratedTextColumn get descripition =>
      _descripition ??= _constructDescripition();
  GeneratedTextColumn _constructDescripition() {
    return GeneratedTextColumn('descripition', $tableName, false,
        minTextLength: 3, maxTextLength: 50);
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn(
      'completed',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, descripition, completed];
  @override
  $TodosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'todos';
  @override
  final String actualTableName = 'todos';
  @override
  VerificationContext validateIntegrity(TodosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.descripition.present) {
      context.handle(
          _descripitionMeta,
          descripition.isAcceptableValue(
              d.descripition.value, _descripitionMeta));
    } else if (descripition.isRequired && isInserting) {
      context.missing(_descripitionMeta);
    }
    if (d.completed.present) {
      context.handle(_completedMeta,
          completed.isAcceptableValue(d.completed.value, _completedMeta));
    } else if (completed.isRequired && isInserting) {
      context.missing(_completedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Todo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TodosCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.descripition.present) {
      map['descripition'] = Variable<String, StringType>(d.descripition.value);
    }
    if (d.completed.present) {
      map['completed'] = Variable<bool, BoolType>(d.completed.value);
    }
    return map;
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(_db, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final int idTodo;
  Favorite({@required this.id, this.idTodo});
  factory Favorite.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return Favorite(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idTodo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_todo']),
    );
  }
  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      idTodo: serializer.fromJson<int>(json['idTodo']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'idTodo': serializer.toJson<int>(idTodo),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Favorite>>(bool nullToAbsent) {
    return FavoritesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idTodo:
          idTodo == null && nullToAbsent ? const Value.absent() : Value(idTodo),
    ) as T;
  }

  Favorite copyWith({int id, int idTodo}) => Favorite(
        id: id ?? this.id,
        idTodo: idTodo ?? this.idTodo,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('idTodo: $idTodo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, idTodo.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Favorite && other.id == id && other.idTodo == idTodo);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<int> idTodo;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.idTodo = const Value.absent(),
  });
  FavoritesCompanion copyWith({Value<int> id, Value<int> idTodo}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      idTodo: idTodo ?? this.idTodo,
    );
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavoritesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idTodoMeta = const VerificationMeta('idTodo');
  GeneratedIntColumn _idTodo;
  @override
  GeneratedIntColumn get idTodo => _idTodo ??= _constructIdTodo();
  GeneratedIntColumn _constructIdTodo() {
    return GeneratedIntColumn(
      'id_todo',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, idTodo];
  @override
  $FavoritesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favorites';
  @override
  final String actualTableName = 'favorites';
  @override
  VerificationContext validateIntegrity(FavoritesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.idTodo.present) {
      context.handle(
          _idTodoMeta, idTodo.isAcceptableValue(d.idTodo.value, _idTodoMeta));
    } else if (idTodo.isRequired && isInserting) {
      context.missing(_idTodoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Favorite.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FavoritesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.idTodo.present) {
      map['id_todo'] = Variable<int, IntType>(d.idTodo.value);
    }
    return map;
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $TodosTable _todos;
  $TodosTable get todos => _todos ??= $TodosTable(this);
  $FavoritesTable _favorites;
  $FavoritesTable get favorites => _favorites ??= $FavoritesTable(this);
  @override
  List<TableInfo> get allTables => [todos, favorites];
}
