import 'package:e_commerce_task/feature/products/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_product_state.dart';

class FavoriteProductCubit extends Cubit<FavoriteProductState> {
  FavoriteProductCubit() : super(FavoriteProductInitial());

  final List<Product> _products = [];

  void addProductsToFavorite(Product product, bool isFavorite) {
    try {
      bool isProductExist = _products.contains(product);
      if (isProductExist) {
        _products.remove(product);
      } else {
        _products.add(product);
      }
      emit(FavoriteProductLoaded(
          products: [..._products], isFavorite: isFavorite));
    } catch (_) {
      emit(FavoriteProductFailure());
    }
  }
}
