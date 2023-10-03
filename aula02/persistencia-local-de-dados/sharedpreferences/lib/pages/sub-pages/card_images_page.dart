import 'package:flutter/material.dart';
import 'package:teladelogin/shared/app_images.dart';

class CardImages extends StatefulWidget {
  const CardImages({super.key});

  @override
  State<CardImages> createState() => _CardImagesState();
}

class _CardImagesState extends State<CardImages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 222, 222, 222),
        child: Column(
          children: [
            Image.asset(
              AppImages.image4,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
