import 'dart:convert';

import 'package:e_commerce_task/feature/products/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsPreferences {
  static const String _productKey = 'products';

  static Future<void> saveUser(List<Product> products) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert List<Product> to List<String>
    List<String> productList =
        products.map((product) => json.encode(product)).toList();

    // Save the list of encoded strings in SharedPreferences
    prefs.setStringList(_productKey, productList);
  }

  static Future<List<Product>?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productJson = prefs.getString(_productKey);

    if (productJson != null) {
      Map<String, dynamic> productMap = json.decode(productJson);
      return productMap.entries
          .map((product) => Product.fromJson(product.value))
          .toList();
    }

    return null;
  }

  static Future<void> clearSavedProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
