part of 'shop_cubit.dart';

sealed class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

final class ShopInitial extends ShopState {}
