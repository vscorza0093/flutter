import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teladelogin/pages/sub-pages/home_page_home.dart';
import 'package:teladelogin/pages/sub-pages/home_page_data.dart';
import 'package:teladelogin/pages/sub-pages/home_page_devices.dart';
import 'package:teladelogin/pages/user_info.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Perfil"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserInfo()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: Text(
                      "Dados cadastrais",
                      style: GoogleFonts.roboto(fontSize: 16),
                    ),
                  )),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: Text(
                      "Termos de uso e privacidade",
                      style: GoogleFonts.roboto(fontSize: 16),
                    ),
                  )),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: Text(
                      "Configurações",
                      style: GoogleFonts.roboto(fontSize: 16),
                    ),
                  )),
              const Divider(),
            ]),
          ),
        ),
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
                  HomeSubPage(),
                  DataSubPage(),
                  DevicesSubPage(),
                ],
              ),
            ),
            BottomNavigationBar(
                currentIndex: currentPage,
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                items: const [
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Data", icon: Icon(Icons.data_array_sharp)),
                  BottomNavigationBarItem(
                      label: "Devices", icon: Icon(Icons.usb)),
                ])
          ],
        ),
      ),
    );
  }
}
