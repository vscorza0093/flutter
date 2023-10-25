import 'package:contactlist/card_page.dart';
import 'package:contactlist/contact_model.dart';
import 'package:contactlist/contact_repository.dart';
import 'package:contactlist/new_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var contactList = ContactModel([]);
  var contactRepository = ContactRepository();

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  void getContacts() async {
    contactList = await contactRepository.getContacts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: contactList.contacts.length,
        itemBuilder: (BuildContext bc, int index) {
          return Dismissible(
              onDismissed: (DismissDirection dir) {
                contactRepository
                    .deleteContact(contactList.contacts[index].objectId);
                getContacts();
              },
              key: UniqueKey(),
              child: Container(
                margin: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      getContacts();
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CardPage(
                        personName: contactList.contacts[index].name,
                        phoneNumber: contactList.contacts[index].phone,
                      ),
                    ));
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 243, 243, 243),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome: ${contactList.contacts[index].name}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Nota: ${contactList.contacts[index].phone}",
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
          getContacts();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext bc) => const NewContactPage()));
        },
        backgroundColor: Colors.orange,
      ),
    );
  }
}
