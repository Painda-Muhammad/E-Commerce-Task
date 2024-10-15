import 'package:e_commerce_task/core/commom_widgets/toast_message.dart';
import 'package:e_commerce_task/feature/bag/cubit/cubit/product_bag_cubit.dart';
import 'package:e_commerce_task/feature/favorite/cubit/cubit/favorite_product_cubit.dart';
import 'package:e_commerce_task/feature/products/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/commom_widgets/buttonContainer.dart';

import '../products/model/favorite_model.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({required this.favoriteProductModel, super.key});

  final FavoritProduct favoriteProductModel;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  dynamic _rating() {
    dynamic value = widget.favoriteProductModel.product!.rating.rate;
    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    }
  }

  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    // optional
    if (widget.favoriteProductModel.isFavorite!) {
      isFavourite = widget.favoriteProductModel.isFavorite!;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.favoriteProductModel.product!.title),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .4,
                        child: Hero(
                            tag: widget.favoriteProductModel.product!,
                            child: Image.network(
                              widget.favoriteProductModel.product!.image,
                            ))),
                    Positioned(
                      bottom: -40,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          icon: isFavourite
                              ? const Icon(
                                  Icons.favorite,
                                  size: 30,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 30,
                                ),
                          onPressed: () {
                            setState(() {
                              isFavourite = !isFavourite;
                              submitProductToFavorite(
                                  widget.favoriteProductModel.product!,
                                  isFavourite);
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.favoriteProductModel.product!.category,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      widget.favoriteProductModel.product!.price.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(widget.favoriteProductModel.product!.title),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: _rating(),
                      itemCount: 5,
                      allowHalfRating: true,
                      itemSize: 20,
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                      onRatingUpdate: (v) {
                        // print('increased rating $v');
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        "(${widget.favoriteProductModel.product!.rating.count})"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.favoriteProductModel.product!.description),
                const SizedBox(
                  height: 40,
                ),
              ]),
            ),
            ButtonContainer(
                ontap: () {
                  submitProductToShop(widget.favoriteProductModel.product!);
                },
                title: 'ADD TO CART')
          ],
        ),
      ),
    );
  }

  void submitProductToShop(Product prod) {
    BlocProvider.of<ProductBagCubit>(context).addProductToBag(prod);

    toastMessage(
        context: context,
        toastMsg: 'The Product is added to Cart',
        color: Theme.of(context).colorScheme.error);
  }

  void submitProductToFavorite(Product prod, bool isFavorite) {
    BlocProvider.of<FavoriteProductCubit>(context)
        .addProductsToFavorite(prod, isFavorite);

    toastMessage(
        context: context,
        toastMsg: isFavorite
            ? 'The Product is added to Favorite'
            : 'The Product is Removed from Favorite',
        color: Theme.of(context).colorScheme.error);
  }
}
