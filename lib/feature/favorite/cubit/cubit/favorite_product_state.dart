part of 'favorite_product_cubit.dart';

sealed class FavoriteProductState extends Equatable {
  const FavoriteProductState();

  @override
  List<Object> get props => [];
}

final class FavoriteProductInitial extends FavoriteProductState {}
final class FavoriteProductLoading extends FavoriteProductState {}
final class FavoriteProductLoaded extends FavoriteProductState {
 const FavoriteProductLoaded({required this.isFavorite,required this.products});
  final List<Product> products;
  final bool isFavorite;

  @override
  List<Object> get props => [products];
}
final class FavoriteProductFailure extends FavoriteProductState {}
