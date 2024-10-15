part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  const ProductsLoaded({required this.products, this.hasReachedMax = false});
  final List<Product>? products;
  final bool hasReachedMax;

  ProductsLoaded copyWith({
    List<Product>? products,
    bool? hasReachedMax,
  }) {
    return ProductsLoaded(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [products!, hasReachedMax];
}

final class ProductFailure extends ProductsState {
  const ProductFailure({required this.errMessage});
  final String errMessage;
}
