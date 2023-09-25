import 'package:flutter/material.dart';
import 'package:teladelogin/model/card_model.dart';
import 'package:teladelogin/pages/card_detail.dart';
import 'package:teladelogin/pages/repositories/card_detail_repository.dart';

class CardHome extends StatefulWidget {
  const CardHome({super.key});

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  CardModel? cardModel;

  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    cardModel = await cardDetailRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
            width: double.infinity,
            child: (cardModel == null)
                ? const LinearProgressIndicator()
                : InkWell(
                    onTap: () {},
                    child: Hero(
                      tag: cardModel!.id,
                      child: Card(
                          elevation: 8,
                          shadowColor: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.network(
                                      "https://hermes.digitalinnovation.one/assets/diome/logo-minimized.png",
                                      height: 35,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      child: Text(
                                        "Meu Card",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, ",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => CardDetail(
                                                  cardModel: cardModel!,
                                                )));
                                  },
                                  child: const Text(
                                    "Ler Mais",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  )),
      ],
    );
  }
}
