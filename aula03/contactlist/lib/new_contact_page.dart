import 'package:contactlist/contact_repository.dart';
import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController photoController = TextEditingController();

  void successMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contato cadastrado com sucesso')));
  }

  void errorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor insira um nome')));
  }

  void closePage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar novo contato'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Name Text
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // Name TextField
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: nameController,
                      textAlignVertical: TextAlignVertical.top,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Phone Number Text
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Número de telefone',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // Phone Number TextField
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: phoneController,
                      textAlignVertical: TextAlignVertical.top,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Photo URL Text
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'URL Foto',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // Photo URL Text Field
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: photoController,
                      textAlignVertical: TextAlignVertical.top,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // Save Text Button
                SizedBox(
                  width: 200,
                  height: 45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: const Color.fromARGB(255, 73, 139, 91),
                      child: TextButton(
                        onPressed: () {
                          ContactRepository contactRepository =
                              ContactRepository();

                          if (nameController.text.length >= 2) {
                            contactRepository.postContact({
                              'name': nameController.text,
                              'phone': phoneController.text,
                              'photo_url': photoController.text
                            });
                            successMessage();
                          } else {
                            errorMessage();
                          }

                          setState(() {});
                          closePage();
                        },
                        child: const Text(
                          'Salvar',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
