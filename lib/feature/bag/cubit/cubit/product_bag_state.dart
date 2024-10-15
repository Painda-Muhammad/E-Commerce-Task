import 'package:e_commerce_task/feature/products/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductBagState extends Equatable {
  const ProductBagState();

  @override
  List<Object> get props => [];
}

final class ProductBagInitial extends ProductBagState {}

final class ProductBagLoading extends ProductBagState {}

final class LoadProductBag extends ProductBagState {}

final class ProductBagLoaded extends ProductBagState {
  final List<Product> products;

  double get totalPrice => products.fold<double>(
      0,
      (previousValue, product) =>
          previousValue + product.price * product.count);
  // double  subProductPrice = 34.3;
//  int get productCount => products.fold(0, (previousValue, element) => previousValue + element.count);
  const ProductBagLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

final class ProductBagFailure extends ProductBagState {}
