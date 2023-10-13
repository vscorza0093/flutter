class Person {
  int id = 0;
  double weight;
  double height;

  Person(this.weight, this.height);

  double getIMCvalue() {
    return weight / (height * height);
  }
}
