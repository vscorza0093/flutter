import 'package:flutter/material.dart';
import 'package:teladelogin/pages/sub-pages/card_home_page.dart';
import 'package:teladelogin/pages/sub-pages/card_data_page.dart';
import 'package:teladelogin/pages/sub-pages/card_device_page.dart';
import 'package:teladelogin/shared/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Perfil"),
      ),
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xff151515),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: const [
                CardHome(),
                CardData(),
                CardDevice(),
              ],
            ),
          ),
          BottomNavigationBar(
              currentIndex: currentPage,
              onTap: (value) {
                pageController.jumpToPage(value);
              },
              items: const [
                BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "Data", icon: Icon(Icons.data_array_sharp)),
                BottomNavigationBarItem(
                    label: "Devices", icon: Icon(Icons.usb)),
              ])
        ],
      ),
    );
  }
}
