import 'package:cervejaiadaappflutter/model/task_back4app_model.dart';
import 'package:cervejaiadaappflutter/repositories/back4app/task_back4app_repository.dart';
import 'package:flutter/material.dart';

class TaskBack4AppPage extends StatefulWidget {
  const TaskBack4AppPage({Key? key}) : super(key: key);

  @override
  State<TaskBack4AppPage> createState() => TaskBack4AppPageState();
}

class TaskBack4AppPageState extends State<TaskBack4AppPage> {
  TaskBack4AppRepository taskRepository = TaskBack4AppRepository();
  var _taskList = TasksBack4AppModel([]);
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
        appBar: AppBar(
          title: const Text('Back4App Task`s'),
        ),
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
                            await taskRepository.create(
                              TaskBack4AppModel.create(descriptionController.text, false)
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
                    const Text("Only not Done", style: TextStyle(fontSize: 18),),
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
                    itemCount: _taskList.taskList.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var task = _taskList.taskList[index];
                      return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async {
                          taskRepository.delete(task.objectId);
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