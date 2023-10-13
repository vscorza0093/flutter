import 'package:calculadoraimc/pages/home_page_card.dart';
import 'package:calculadoraimc/pages/imc_page_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Page Controller
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (int value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: const [
                  HomePageCard(),
                  IMCPageCard(),
                ],
              ),
            ),
            // Barra de navegação inferior
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentPage,
              onTap: (int value) {
                pageController.jumpToPage(value);
              },
              items: const [
                BottomNavigationBarItem(
                    label: 'home', icon: Icon(Icons.home_outlined)),
                BottomNavigationBarItem(
                    label: 'imc', icon: Icon(Icons.calculate_outlined))
              ],
            )
          ],
        ),
      ),
    );
  }
}
