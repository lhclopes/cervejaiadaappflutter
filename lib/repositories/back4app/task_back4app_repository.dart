import 'package:cervejaiadaappflutter/model/task_back4app_model.dart';
import 'back4app_custom_dio.dart';

class TaskBack4AppRepository {
  final _customDio = Back4AppCustomDio();

  TaskBack4AppRepository();

  Future<TasksBack4AppModel> getAll(bool naoConcluidas) async {
    var url = "/Tasks";
    if (naoConcluidas) {
      url = "$url?where={\"done\":false}";
    }

    var result = await _customDio.dio.get(url);
    return TasksBack4AppModel.fromJson(result.data);
  }

  Future<void> create(TaskBack4AppModel tarefaBack4AppModel) async {
    try {
      await _customDio.dio.post("/Tasks", data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> update(TaskBack4AppModel tarefaBack4AppModel) async {
    try {
      var response = await _customDio.dio.put(
          "/Tasks/${tarefaBack4AppModel.objectId}",
          data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> delete(String objectId) async {
    try {
      var response = await _customDio.dio.delete(
        "/Tasks/$objectId",
      );
    } catch (e) {
      throw e;
    }
  }
}
