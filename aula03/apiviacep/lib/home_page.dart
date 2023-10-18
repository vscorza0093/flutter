import 'package:apiviacep/list_cep_page.dart';
import 'package:apiviacep/register_cep_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              children: const [
                RegisterCEPPage(),
                ListCEPPage(),
              ],
            ),
          ),
          BottomNavigationBar(
            selectedFontSize: 15,
            selectedItemColor: Colors.amber[800],
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              closeKeyboard();
              pageController.jumpToPage(value);
            },
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: "Cadastrar"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: "Visualizar")
            ],
          )
        ],
      ),
    );
  }
}
