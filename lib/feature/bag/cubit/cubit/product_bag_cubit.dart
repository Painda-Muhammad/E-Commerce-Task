import 'package:e_commerce_task/feature/bag/cubit/cubit/product_bag_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/model/product_model.dart';

class ProductBagCubit extends Cubit<ProductBagState> {
  ProductBagCubit() : super(ProductBagInitial());

  final List<Product> _items = [];

  void addProductToBag(Product product) {
    if (!_items.contains(product)) {
      _items.add(product);
      emit(ProductBagLoaded(
          products: [..._items])); // Ensure state reflects change
    } else {
      return;
    }
  }

  void removeItemFromBag(Product product) {
    if (_items.contains(product)) {
      _items.remove(product);
      emit(ProductBagLoaded(
          products: [..._items])); // Update state after removal
    }
  }

  void _incrementProduct(Product product) {
    final index = _items.indexOf(product);
    if (index != -1) {
      // Create a new instance with updated count
      _items[index] = product.copyWith(count: product.count + 1);
    }
  }

  void _decrementProduct(Product product) {
    final index = _items.indexOf(product);
    if (index != -1) {
      if (product.count > 1) {
        _items[index] = product.copyWith(count: product.count - 1);
      } else {
        removeItemFromBag(product); // Remove product if count is 0
      }
    }
  }

  Future<void> incrementProduct(Product product) async {
    try {
      if (state is ProductBagLoaded) {
        _incrementProduct(product);
        emit(ProductBagLoaded(
            products: [..._items])); // Emit new state with updated products
        print('Product incremented');
      }
    } catch (_) {
      emit(ProductBagFailure());
    }
  }

  Future<void> decrementProduct(Product product) async {
    try {
      if (state is ProductBagLoaded) {
        _decrementProduct(product);
        emit(ProductBagLoaded(
            products: [..._items])); // Emit new state with updated products
        print('Product decremented');
      }
    } catch (_) {
      emit(ProductBagFailure());
    }
  }
}
