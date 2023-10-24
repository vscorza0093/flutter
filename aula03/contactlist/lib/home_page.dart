import 'package:contactlist/card_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> nameList = <String>[
    'Vinicius Scorza',
    'Paula Hemsi',
    'Maria Cristina Scorza',
    'Maria Lucia de Paula',
    'Milton Scorza',
  ];

  List<String> phoneNumber = <String>[
    '666-666-66',
    '0123456s2',
    '123456789',
    '123456789',
    '123456789',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: nameList.length,
        itemBuilder: (BuildContext bc, int index) {
          return Dismissible(
              onDismissed: (DismissDirection dir) {
                setState(() {
                  nameList.remove(nameList[index]);
                  phoneNumber.remove(phoneNumber[index]);
                });
                debugPrint('remove item $index');
              },
              key: UniqueKey(),
              child: Container(
                margin: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CardPage(
                        personName: nameList[index],
                        phoneNumber: phoneNumber[index],
                      ),
                    ));
                    debugPrint('clicked');
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 230, 230, 230),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome: ${nameList[index]}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Text(
                            "Nota: ${phoneNumber[index]}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
