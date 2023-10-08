import 'package:flutter/material.dart';
import 'package:teladelogin/model/card_model.dart';

class CardDetail extends StatelessWidget {
  final CardModel cardModel;
  const CardDetail({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardModel.id,
      child: Scaffold(
        appBar: AppBar(
          title: Text(cardModel.title),
          backgroundColor: Colors.orange,
        ),
        backgroundColor: const Color.fromARGB(255, 40, 40, 40),
        body: Card(
          margin: const EdgeInsets.all(15),
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          "https://hermes.digitalinnovation.one/assets/diome/logo-minimized.png",
                          height: 100,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Meu Card",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Text(
                    cardModel.text.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
