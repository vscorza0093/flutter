import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teladelogin/pages/sub-pages/home_page_sub1.dart';
import 'package:teladelogin/pages/sub-pages/home_page_sub2.dart';
import 'package:teladelogin/pages/sub-pages/home_page_sub3.dart';
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
          title: const Text("Página inicial"),
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
                            builder: (context) => const UserInfo(
                                  pageTitle: "Dados cadastrais",
                                )));
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
                  HomePageSub1(),
                  HomePageSub2(),
                  HomePageSub3(),
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
                      label: "Pag 1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Pag 2", icon: Icon(Icons.abc_sharp)),
                  BottomNavigationBarItem(
                      label: "Pag 3", icon: Icon(Icons.usb)),
                ])
          ],
        ),
      ),
    );
  }
}
