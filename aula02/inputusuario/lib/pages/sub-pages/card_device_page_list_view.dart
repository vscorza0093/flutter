import 'package:flutter/material.dart';
import 'package:teladelogin/shared/app_images.dart';

class CardDeviceVerticalListView extends StatelessWidget {
  const CardDeviceVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
        body: ListView(
          children: [
            ListTile(
              leading: Image.asset(AppImages.image1),
              title: const Text(
                "Mi(ngi), Diablo e Sleep Token",
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Música e RPG"),
                  Text(DateTime.now().toString().substring(0, 10)),
                ],
              ),
              trailing: PopupMenuButton<String>(
                itemBuilder: (BuildContext buildContext) {
                  return <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: "option1",
                      child: Text("Opção 1"),
                    ),
                    const PopupMenuItem<String>(
                      value: "option2",
                      child: Text("Opção 2"),
                    ),
                    const PopupMenuItem<String>(
                      value: "option3",
                      child: Text("Opção 3"),
                    )
                  ];
                },
                onSelected: (value) {
                  debugPrint(value);
                },
              ),
            ),
            Image.asset(AppImages.image1),
            Image.asset(AppImages.image2),
            Image.asset(AppImages.image3),
            Image.asset('assets/images/mi.png'),
            Image.asset('assets/images/mingi-ateez.gif'),
            Image.asset(AppImages.image4),
          ],
        ),
      ),
    );
  }
}
