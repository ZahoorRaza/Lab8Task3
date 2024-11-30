import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_controller.dart';

class CartPage extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Obx(() {
        return productController.cart.isEmpty
            ? Center(child: Text("Your cart is empty"))
            : ListView.builder(
          itemCount: productController.cart.length,
          itemBuilder: (context, index) {
            final product = productController.cart[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () {
                  productController.removeFromCart(product);
                  Get.snackbar("Removed from Cart", product.name);
                },
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        final totalPrice = productController.cart.fold(
            0.0, (sum, item) => sum + item.price);
        return Container(
          padding: EdgeInsets.all(16),
          child: Text(
            "Total: \$${totalPrice.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }
}
