class TasksBack4AppModel {
  List<TaskBack4AppModel> taskList = [];

  TasksBack4AppModel(this.taskList);

  TasksBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      taskList = <TaskBack4AppModel>[];
      json['results'].forEach((v) {
        taskList.add(TaskBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = taskList.map((v) => v.toJson()).toList();
    return data;
  }
}

class TaskBack4AppModel {
  String objectId = "";
  String description = "";
  bool done = false;
  String createdAt = "";
  String updatedAt = "";

  TaskBack4AppModel(this.objectId, this.description, this.done,
      this.createdAt, this.updatedAt);

  TaskBack4AppModel.create(this.description, this.done);

  TaskBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    description = json['description'];
    done = json['done'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['description'] = description;
    data['done'] = done;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['done'] = done;
    return data;
  }
}