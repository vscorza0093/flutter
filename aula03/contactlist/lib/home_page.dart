import 'package:contactlist/card_page.dart';
import 'package:contactlist/new_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> nameList = <String>[
    'Vinicius',
    'Paula',
    'Maria Cristina',
    'Maria Lucia',
    'Milton',
  ];

  List<String> phoneNumber = <String>[
    '666-666-666',
    '012-345-6s2',
    '123-456-789',
    '123-456-789',
    '123-456-789',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        backgroundColor: Colors.orange,
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
                    color: const Color.fromARGB(255, 243, 243, 243),
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
                            height: 16,
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
      bottomNavigationBar: ConvexAppBar(
        height: 30,
        items: const [
          TabItem(
            icon: Icon(Icons.add),
            title: 'Add contact',
          ),
        ],
        onTap: (int i) {
          debugPrint('Add contact');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext bc) => const NewContactPage()));
        },
        backgroundColor: Colors.orange,
      ),
    );
  }
}
