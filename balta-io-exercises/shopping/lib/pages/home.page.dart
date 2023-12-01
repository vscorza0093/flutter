import 'package:flutter/material.dart';
import 'package:shopping/widgets/category/category-list.widget.dart';
import 'package:shopping/widgets/product/product-list.widget.dart';
import 'package:shopping/widgets/search-box.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        color: const Color(0xFFF5F5F5),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                const SearchBox(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 90,
                  child: CategoryList(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Selling",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                    height: 300,
                    child: ProductList(
                      scrollDirection: Axis.horizontal,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
