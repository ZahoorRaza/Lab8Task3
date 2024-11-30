import 'package:get/get.dart';

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

class ProductController extends GetxController {
  // List of products
  final products = <Product>[
    Product(id: 1, name: "Apple", price: 2.0),
    Product(id: 2, name: "Banana", price: 1.5),
    Product(id: 3, name: "Orange", price: 3.0),
  ].obs;

  // Shopping cart
  final cart = <Product>[].obs;

  void addToCart(Product product) {
    cart.add(product);
  }

  void removeFromCart(Product product) {
    cart.remove(product);
  }
}
