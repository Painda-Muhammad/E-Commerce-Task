import 'package:e_commerce_task/feature/products/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit/favorite_product_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'My Favorites',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
        builder: (context, state) {
          if (state is FavoriteProductLoaded) {
            return state.products.isEmpty
                ? const Center(child: Text('No Product is added to Favorite'))
                : ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ProductItem(
                        isGrade: false,
                        loadedProducts: state.products[index],
                        isFavorite: state.isFavorite,
                      ),
                    ),
                  );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
