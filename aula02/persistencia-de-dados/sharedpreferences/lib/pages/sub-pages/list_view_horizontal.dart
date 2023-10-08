import 'package:flutter/material.dart';
import 'package:teladelogin/shared/app_images.dart';

class CardHorizontalListView extends StatefulWidget {
  const CardHorizontalListView({super.key});

  @override
  State<CardHorizontalListView> createState() => _CardHorizontalListViewState();
}

class _CardHorizontalListViewState extends State<CardHorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(child: Image.asset(AppImages.image1)),
                  Card(child: Image.asset(AppImages.image3)),
                  Card(child: Image.asset(AppImages.image2))
                ],
              ),
            ),
            Expanded(flex: 1, child: Container())
          ],
        ),
      ),
    );
  }
}
