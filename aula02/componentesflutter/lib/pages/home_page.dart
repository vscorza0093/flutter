import 'package:componentesflutter/service/random_number_generator_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int randomNumber = 0;
  int clickQuantity = 0;
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("Before return Scaffold");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Números aleatórios",
          // style: GoogleFonts.ruda(),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: clickQuantity.toDouble(),
            vertical: clickQuantity.toDouble()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerRight,
              color: Colors.cyan,
              child: Text(
                "$clickQuantity",
                style: GoogleFonts.aboreto(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                alignment: Alignment.centerRight,
                color: Colors.amber,
                child: Text(
                  "$randomNumber",
                  style: GoogleFonts.aboreto(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Text(
                "--------------",
                style: GoogleFonts.aboreto(fontSize: 40, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              color: Colors.teal,
              child: Text(
                "${sum += (randomNumber * clickQuantity)}",
                style: GoogleFonts.aboreto(fontSize: 40, color: Colors.white),
              ),
            ),
            Container(
              color: Colors.indigo,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "0",
                      style:
                          GoogleFonts.abel(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      "1",
                      style:
                          GoogleFonts.abel(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      "2",
                      style:
                          GoogleFonts.abel(fontSize: 25, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Before set state");
          setState(() {
            clickQuantity += 1;
            randomNumber =
                RandomNumberGeneratorService.generateRandomNumber(10001);
            if (clickQuantity > 70) {
              clickQuantity = 0;
            }
          });
        },
        mini: true,
        child: const Icon(Icons.add_circle),
      ),
    ); // Scaffold
  }
}
