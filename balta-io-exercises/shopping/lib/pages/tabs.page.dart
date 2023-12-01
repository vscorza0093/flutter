import 'package:flutter/material.dart';
import 'package:shopping/pages/cart.page.dart';
import 'package:shopping/pages/home.page.dart';
import 'package:shopping/pages/login.page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TabBarView(
        children: [
          HomePage(),
          CartPage(),
          LoginPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.shopping_cart),
          ),
          Tab(
            icon: Icon(Icons.perm_identity),
          ),
        ],
        labelColor: Theme.of(context).primaryColor, 
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.all(5),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
