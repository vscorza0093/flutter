import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              child: productList(context),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$4250",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Finalizar",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget productList(BuildContext context) {
  return ListView(
    children: [
      productItem(context),
      productItem(context),
      productItem(context),
      productItem(context),
      productItem(context),
      productItem(context),
      productItem(context),
      productItem(context),
      productItem(context),
      productItem(context),
    ],
  );
}

Widget productItem(BuildContext context) {
  return Container(
    height: 120,
    margin: const EdgeInsets.all(5),
    child: Row(
      children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(10),
          child: Image.asset(
            "assets/product-1.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Titulo do produto"),
              Text(
                "\$ 200",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 30,
                width: 120,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: TextButton(
                        child: const Text(
                          "+",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: const Text("1"),
                    ),
                    Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: TextButton(
                        child: const Text(
                          "-",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
