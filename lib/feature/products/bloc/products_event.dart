part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

final class LoadAllProducts extends ProductsEvent {}

final class LoadSearchedProducts extends ProductsEvent {
  final String searchQuery;
  const LoadSearchedProducts({required this.searchQuery});
}

// final class LoadIntialPaginatedProducts extends ProductsEvent {}
final class LoadPaginatedProducts extends ProductsEvent {}
