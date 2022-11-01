class TaskSQLiteModel {
  int _id = 0;
  String _description = "";
  bool _done = false;

  TaskSQLiteModel(this._id, this._description, this._done);

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  String get description => _description;

  set description(String description) {
    _description = description;
  }

  bool get done => _done;

  set done(bool done) {
    _done = done;
  }
}