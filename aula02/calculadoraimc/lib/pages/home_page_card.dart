import 'package:calculadoraimc/const_attributes.dart';
import 'package:calculadoraimc/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageCard extends StatefulWidget {
  const HomePageCard({super.key});

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  double resultado = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(HOME_TITLE, HOME_KEY, HOME_COLOR),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Último cálculo realizado',
                    style: GoogleFonts.roboto(fontSize: 35),
                  ),
                ],
              ),
            ),
            Text(
              resultado == 0
                  ? 'Faça seu primeiro cálculo'
                  : resultado.toString(),
              style: GoogleFonts.roboto(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
