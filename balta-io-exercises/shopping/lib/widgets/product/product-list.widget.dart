import 'package:flutter/material.dart';
import 'package:shopping/widgets/product/product.model.dart';
import 'package:shopping/widgets/product/product.repository.dart';
import 'package:shopping/widgets/product/product-item.widget.dart';

class ProductList extends StatefulWidget {
  final Axis scrollDirection;

  const ProductList({super.key, required this.scrollDirection});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductModel productList = ProductModel([]);
  ProductRepository productRepository = ProductRepository();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    productList = await productRepository.getProductList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: ListView.builder(
        scrollDirection: widget.scrollDirection,
        itemCount: productList.products.length,
        itemBuilder: (BuildContext bc, int index) {
          return ProductItem(
            image: productList.products[index].productImage!.url.toString(),
            title: productList.products[index].productTitle,
            brand: productList.products[index].productBrand,
            description: productList.products[index].productDescription,
            price: productList.products[index].productPrice.toDouble(),
          );
        },
        // children: const [
        //   ProductItem(
        //     image: "assets/product-1.png",
        //     title: "BeoPlay Speaker",
        //     brand: "Bang and Olufsen",
        //     description: "description",
        //     price: 775,
        //   ),
        // ],
      ),
    );
  }
}
