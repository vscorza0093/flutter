import 'package:flutter/material.dart';
import 'package:teladelogin/model/configurations_model.dart';
import 'package:teladelogin/pages/repositories/configs_repository.dart';

class ConfigurationsPage extends StatefulWidget {
  const ConfigurationsPage({super.key});

  @override
  State<ConfigurationsPage> createState() => _ConfigurationsPageState();
}

class _ConfigurationsPageState extends State<ConfigurationsPage> {
  late ConfigRepository configRepository;

  ConfigurationsModel configurationsModel = ConfigurationsModel.empty();

  TextEditingController userNameController = TextEditingController();
  TextEditingController userHeightController = TextEditingController();

  bool receiveNotification = false;
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    configRepository = await ConfigRepository.loadAsyncConfigRepository();
    configurationsModel = configRepository.obtainData();
    userNameController.text = configurationsModel.getUserName();
    userHeightController.text = configurationsModel.getUserHeight().toString();
    darkMode = configurationsModel.getDarkMode();
    receiveNotification = configurationsModel.getReceiveNotification();
    setState(() {});
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void closePage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text("Configurações")),
        body: Container(
          padding: const EdgeInsets.all(2.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              SwitchListTile(
                value: receiveNotification,
                onChanged: (bool value) {
                  setState(() {
                    receiveNotification = !receiveNotification;
                  });
                },
                secondary: const Icon(Icons.notifications),
              ),
              const Divider(
                height: 0,
              ),
              SwitchListTile(
                value: darkMode,
                onChanged: (bool value) {
                  setState(() {
                    darkMode = !darkMode;
                  });
                },
                secondary: const Icon(Icons.dark_mode),
              ),
              SizedBox(
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome de usuário"),
                  controller: userNameController,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Altura em centímetros'),
                  controller: userHeightController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () async {
                    try {
                      configurationsModel.setUserHeight(
                          double.parse(userHeightController.text));
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("Erro"),
                              content: const Text("Altura inválida"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      closeKeyboard();
                                      closePage();
                                    },
                                    child: const Text("Confirmar"))
                              ],
                            );
                          });
                      return;
                    }
                    configurationsModel.setUserName(userNameController.text);
                    configurationsModel.setDarkMode(darkMode);
                    configurationsModel
                        .setReceiveNotification(receiveNotification);

                    configRepository.saveConfigurations(configurationsModel);
                    closeKeyboard();
                    closePage();
                  },
                  child: const Text("SALVAR"))
            ],
          ),
        ),
      ),
    ));
  }
}
