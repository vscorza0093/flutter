import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teladelogin/pages/configs_page.dart';
import 'package:teladelogin/pages/login_page.dart';
import 'package:teladelogin/pages/num_generator_page.dart';
import 'package:teladelogin/pages/user_info/user_info_hive_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (BuildContext buildContext) {
                  return Wrap(
                    children: [
                      ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Camera"),
                          leading: const Icon(
                            Icons.camera,
                            color: Colors.orange,
                          )),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const Text("Galeria"),
                        leading: const Icon(
                          Icons.album,
                          color: Colors.orange,
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                });
          },
          child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 203, 237, 236),
                  child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo-minimized.png",
                  )),
              accountName: const Text('Vinicius Scorza'),
              accountEmail: const Text('vinicius@email.com')),
        ),
        InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserInfo()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Dados cadastrais",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            )),
        const Divider(),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext buildContext) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Termos de Uso",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, ",
                            style: TextStyle(fontSize: 18),
                          ),
                          const Expanded(child: Column()),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Aceitar",
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.pageview,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Text(
                    "Termos de uso e privacidade",
                    style:
                        GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            )),
        const Divider(),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NumGeneratorPage()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.numbers,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Gerador de Números",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            )),
        const Divider(),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfigurationsPage()));
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.home_repair_service,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "Configurações",
                      style:
                          GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              )),
        ),
        const Divider(),
        const Expanded(child: Column()),
        Center(
          child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext buildContext) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: const Text(
                          "Deseja realmente encerrar a sessão?",
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Não",
                                  style: TextStyle(fontSize: 16))),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ));
                              },
                              child: const Text("Sim",
                                  style: TextStyle(fontSize: 16))),
                        ],
                      );
                    });
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "Sair",
                      style:
                          GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              )),
        )
      ]),
    );
  }
}
