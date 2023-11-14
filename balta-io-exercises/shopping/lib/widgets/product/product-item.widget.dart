import 'package:flutter/material.dart';
import 'package:shopping/pages/product.page.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String title;
  final String brand;
  final String description;
  final double price;

  const ProductItem(
      {super.key,
      required this.image,
      required this.title,
      required this.brand,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      width: 170,
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                      image: image,
                      title: title,
                      brand: brand,
                      description: description,
                      price: price),
                ),
              );
            },
            child: Image.network(
              image,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Text(
            brand,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "\$ $price",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00C569),
            ),
          ),
        ],
      ),
    );
  }
}
