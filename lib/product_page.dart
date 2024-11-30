import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_page.dart';
import 'product_controller.dart';

class ProductListPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartPage());
            },
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
              trailing: ElevatedButton(
                onPressed: () {
                  productController.addToCart(product);
                  Get.snackbar("Added to Cart", product.name);
                },
                child: Text("Add to Cart"),
              ),
            );
          },
        );
      }),
    );
  }
}
