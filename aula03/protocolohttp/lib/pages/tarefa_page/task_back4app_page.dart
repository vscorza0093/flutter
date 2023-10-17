import 'package:flutter/material.dart';
import 'package:protocolohttp/model/back4app/task_back4app_model.dart';
import 'package:protocolohttp/repositories/back4app/tasks_http_repository.dart';

class TaskHTTPPage extends StatefulWidget {
  const TaskHTTPPage({Key? key}) : super(key: key);

  @override
  State<TaskHTTPPage> createState() => _TaskHTTPPageState();
}

class _TaskHTTPPageState extends State<TaskHTTPPage> {
  TasksBack4AppRepository tarefaRepository = TasksBack4AppRepository();
  var _tasksBack4App = TaskBack4AppModel([]);
  var descricaoContoller = TextEditingController();
  var apenasNaoConcluidos = false;
  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {
      carregando = true;
    });
    _tasksBack4App = await tarefaRepository.getTask(apenasNaoConcluidos);
    setState(() {
      carregando = false;
    });
  }

  void closePage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tarefas HTTP")),
        // Nova Tarefa
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descricaoContoller.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar tarefa"),
                    content: TextField(
                      controller: descricaoContoller,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            await tarefaRepository.postTask(
                                Task.post(descricaoContoller.text, false));
                            closePage();
                            obterTarefas();
                            setState(() {});
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              // Tarefas não concluídas
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Apenas não concluídos",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: apenasNaoConcluidos,
                        onChanged: (bool value) {
                          apenasNaoConcluidos = value;
                          obterTarefas();
                        })
                  ],
                ),
              ),
              // Obter Tarefas
              carregando
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: _tasksBack4App.tasks.length,
                          itemBuilder: (BuildContext bc, int index) {
                            var tarefa = _tasksBack4App.tasks[index];
                            return Dismissible(
                              onDismissed:
                                  (DismissDirection dismissDirection) async {
                                tarefaRepository.deleteTask(tarefa.objectId);
                                obterTarefas();
                              },
                              key: Key(tarefa.description),
                              child: ListTile(
                                title: Text(tarefa.description),
                                trailing: Switch(
                                  onChanged: (bool value) async {
                                    tarefa.concluded = value;
                                    await tarefaRepository.putTask(tarefa);
                                    obterTarefas();
                                  },
                                  value: tarefa.concluded,
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
