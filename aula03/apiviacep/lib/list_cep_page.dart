import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCEPPage extends StatefulWidget {
  const ListCEPPage({super.key});

  @override
  State<ListCEPPage> createState() => _ListCEPPageState();
}

class _ListCEPPageState extends State<ListCEPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 60, 60),
        title: const Text('Visualizar Cadastrados'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Filtro por CEP:',
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 60,
              ),
              SizedBox(
                width: 150,
                height: 60,
                child: TextField(
                  textAlign: TextAlign.justify,
                  onTap: () {},
                  style: GoogleFonts.roboto(color: Colors.black),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff151515),
                      ),
                      hintText: "00101000",
                      hintStyle: GoogleFonts.roboto(
                          color: const Color(0xff666666), fontSize: 18)),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 100,
            child: Card(
              color: Colors.blue,
              child: Container(),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 100,
            child: Card(
              color: Colors.red,
              child: Container(),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 100,
            child: Card(
              color: Colors.yellow,
              child: Container(),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 100,
            child: Card(
              color: Colors.purple,
              child: Container(),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 100,
            child: Card(
              color: Colors.green,
              child: Container(),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 100,
            child: Card(
              color: Colors.cyan,
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
