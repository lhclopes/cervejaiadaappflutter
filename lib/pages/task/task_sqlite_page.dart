import 'package:cervejaiadaappflutter/model/task_sqlite_model.dart';
import 'package:cervejaiadaappflutter/repositories/sqlite/task_sqlite_repository.dart';
import 'package:flutter/material.dart';

class TaskSQLitePage extends StatefulWidget {
  const TaskSQLitePage({Key? key}) : super(key: key);

  @override
  State<TaskSQLitePage> createState() => _TarefaSQLitePageState();
}

class _TarefaSQLitePageState extends State<TaskSQLitePage> {
  TaskSQLiteRepository taskRepository = TaskSQLiteRepository();
  var _taskList = const <TaskSQLiteModel>[];
  var descriptionController = TextEditingController();
  var onlyNotDone = false;

  @override
  void initState() {
    super.initState();
    getAllTasks();
  }

  void getAllTasks() async {
    _taskList = await taskRepository.getAll(onlyNotDone);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descriptionController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Add task"),
                    content: TextField(
                      controller: descriptionController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      TextButton(
                          onPressed: () async {
                            await taskRepository.save(
                              TaskSQLiteModel(0, descriptionController.text, false)
                            );
                            Navigator.pop(context);
                            getAllTasks();
                            setState(() {});
                          },
                          child: const Text("Save"))
                    ],
                  );
                });
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Only not Done",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: onlyNotDone,
                        onChanged: (bool value) {
                          onlyNotDone = value;
                          getAllTasks();
                        })
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _taskList.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var task = _taskList[index];
                      return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async {
                          taskRepository.delete(task.id);
                          getAllTasks();
                        },
                        key: Key(task.description),
                        child: ListTile(
                          title: Text(task.description),
                          trailing: Switch(
                            onChanged: (bool value) async {
                              task.done = value;
                              taskRepository.update(task);
                              getAllTasks();
                            },
                            value: task.done,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}