import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_commerce_task/core/constants/api_constants.dart';
import 'package:e_commerce_task/feature/products/model/product_model.dart';

Future<List<Product>> getAllProducts(
    {String? limit, String? skip, int page = 1}) async {
  final url = Uri.parse('$kbaseUrl$kproducts?limit=$limit&skip=$skip');

  try {
    final response = await http.get(url);
    final jsondata = json.decode(response.body);

    if (response.statusCode == 200) {
      page++;
      return (jsondata as List)
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw ('Some Thing went wrong');
    }
  } catch (e) {
    throw ('Erro While fetching Data');
  }
}
