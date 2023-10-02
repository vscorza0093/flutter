import 'package:teladelogin/model/card_model.dart';

class CardDetailRepository {
  Future<CardModel> get() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return CardModel(
        1,
        "Meu Card",
        "https://hermes.digitalinnovation.one/assets/diome/logo-minimized.png",
        "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica");
  }
}
