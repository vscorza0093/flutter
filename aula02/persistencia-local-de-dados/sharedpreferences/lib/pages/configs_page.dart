import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teladelogin/const_variables.dart';

class ConfigurationsPage extends StatefulWidget {
  const ConfigurationsPage({super.key});

  @override
  State<ConfigurationsPage> createState() => _ConfigurationsPageState();
}

class _ConfigurationsPageState extends State<ConfigurationsPage> {
  late SharedPreferences sharedPreferences;

  TextEditingController userNameController = TextEditingController();
  TextEditingController userHeightController = TextEditingController();
  TextEditingController darkModeController = TextEditingController();
  TextEditingController receiveNotificationController = TextEditingController();

  String? userName;
  double? userHeight;
  double? weight;
  bool receiveNotification = false;
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
    userNameController.text = sharedPreferences.getString(USER_NAME_KEY) ?? "";
    userHeightController.text =
        (sharedPreferences.getDouble(USER_HEIGHT_KEY) ?? 0.0).toString();
    darkMode = sharedPreferences.getBool(DARK_MODE_KEY) ?? false;
    receiveNotification =
        sharedPreferences.getBool(RECEIVE_NOTIFICATION_KEY) ?? false;
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void closePage() {
    Navigator.pop(context);
  }

  void catchInvalidHeight() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text("Configurações")),
        body: Container(
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
                      await sharedPreferences.setDouble(USER_HEIGHT_KEY,
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
                    await sharedPreferences.setString(
                        USER_NAME_KEY, userNameController.text);
                    await sharedPreferences.setBool(DARK_MODE_KEY, darkMode);
                    await sharedPreferences.setBool(
                        RECEIVE_NOTIFICATION_KEY, receiveNotification);
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
