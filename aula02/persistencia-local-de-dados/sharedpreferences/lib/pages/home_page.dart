import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teladelogin/pages/sub-pages/card_home_page.dart';
import 'package:teladelogin/pages/sub-pages/card_images_page.dart';
import 'package:teladelogin/pages/sub-pages/card_device_page_list_view.dart';
import 'package:teladelogin/pages/sub-pages/list_view_horizontal.dart';
import 'package:teladelogin/shared/widgets/custom_drawer.dart';
import 'package:teladelogin/pages/task_page.dart';

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
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.red),
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
                CardImages(),
                CardDeviceVerticalListView(),
                CardHorizontalListView(),
                TaskPage(),
              ],
            ),
          ),
          BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
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
                BottomNavigationBarItem(
                    label: "Horizontal",
                    icon: Icon(Icons.horizontal_distribute)),
                BottomNavigationBarItem(label: "Tasks", icon: Icon(Icons.list))
              ])
        ],
      ),
    );
  }
}
