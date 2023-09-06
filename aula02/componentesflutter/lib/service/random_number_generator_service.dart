import 'dart:math';

class RandomNumberGeneratorService {
  static int generateRandomNumber(int max) {
    Random randomNumber = Random();
    return randomNumber.nextInt(max);
  }
}
