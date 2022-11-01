import 'package:cervejaiadaappflutter/model/task_sqlite_model.dart';
import 'package:cervejaiadaappflutter/repositories/sqlite/sqlitedatabase.dart';

class TaskSQLiteRepository {
  Future<List<TaskSQLiteModel>> getAll(bool onlyNotDone) async {
    List<TaskSQLiteModel> taskList = [];

    var db = await SQLiteDataBase().getDatabase();
    var result = await db.rawQuery(onlyNotDone
        ? "SELECT id, description, done FROM task WHERE done = 0"
        : 'SELECT id, description, done FROM task');

    for (var element in result) {
      taskList.add(
        TaskSQLiteModel(
          int.parse(element["id"].toString()),
          element["description"].toString(),
          element["done"] == 1
        )
      );
    }

    return taskList;
  }

  Future<void> save(TaskSQLiteModel tarefaSQLiteModel) async {
    var db = await SQLiteDataBase().getDatabase();

    await db.rawInsert(
      'INSERT INTO task(description, done) values(?,?)',
      [tarefaSQLiteModel.description, tarefaSQLiteModel.done]
    );
  }

  Future<void> update(TaskSQLiteModel tarefaSQLiteModel) async {
    var db = await SQLiteDataBase().getDatabase();

    await db.rawInsert(
      'UPDATE task SET description = ?, done = ? WHERE id = ?',
      [
        tarefaSQLiteModel.description,
        tarefaSQLiteModel.done ? 1 : 0,
        tarefaSQLiteModel.id
      ]
    );
  }

  Future<void> delete(int id) async {
    var db = await SQLiteDataBase().getDatabase();
    await db.rawInsert('DELETE FROM task WHERE id = ?', [id]);
  }
}