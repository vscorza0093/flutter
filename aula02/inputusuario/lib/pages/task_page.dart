import 'package:flutter/material.dart';
import 'package:teladelogin/model/task.dart';
import 'package:teladelogin/pages/repositories/task_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool notConcluded = false;

  List<Task> _listOfTasks = const <Task>[];
  TextEditingController descriptionController = TextEditingController();
  TaskRepository taskRepository = TaskRepository();

  @override
  void initState() {
    super.initState();
    obtainTask();
  }

  void obtainTask() async {
    if (notConcluded) {
      _listOfTasks = await taskRepository.listNotConcluded();
    } else {
      _listOfTasks = await taskRepository.getTasks();
    }
    setState(() {});
  }

  void closePage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext buildContext) {
                  return AlertDialog(
                    title: const Text("Adicionar tarefa"),
                    content: TextField(
                      controller: descriptionController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            descriptionController.text = '';
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            await taskRepository.addTask(
                                Task(descriptionController.text, false));
                            debugPrint(descriptionController.text);
                            closePage();
                            setState(() {});
                            descriptionController.text = '';
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Não concluídos",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: notConcluded,
                        onChanged: (bool value) {
                          notConcluded = value;
                          setState(() {
                            obtainTask();
                          });
                        })
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _listOfTasks.length,
                    itemBuilder: (
                      BuildContext buildContext,
                      int index,
                    ) {
                      var task = _listOfTasks[index];
                      return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async {
                          await taskRepository.removeTask(task.getId);
                          obtainTask();
                        },
                        key: Key(task.getId),
                        child: ListTile(
                          title: Text(task.getDescription),
                          trailing: Switch(
                              value: task.getConcluded,
                              onChanged: (bool value) async {
                                await taskRepository.updateTask(
                                    task.getId, value);
                                obtainTask();
                              }),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
