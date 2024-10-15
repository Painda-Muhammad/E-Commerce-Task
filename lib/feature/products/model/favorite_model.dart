import 'package:e_commerce_task/feature/products/model/product_model.dart';

class FavoritProduct {
  final Product? product;
  final bool? isFavorite;

  FavoritProduct({this.isFavorite, this.product});
}
