import 'package:e_commerce_task/core/commom_widgets/toast_message.dart';
import 'package:e_commerce_task/core/constants/page_constant.dart';
import 'package:e_commerce_task/feature/products/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../favorite/cubit/cubit/favorite_product_cubit.dart';
import '../model/product_model.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(
      {this.isFavorite,
      required this.isGrade,
      required this.loadedProducts,
      super.key});

  final Product loadedProducts;
  final bool isGrade;
  final bool? isFavorite;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  dynamic _rating() {
    final ratingValue = widget.loadedProducts.rating.rate;
    if (ratingValue is int) {
      return ratingValue.toDouble();
    }
    return ratingValue;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFavorite != null) {
      isFavorite = widget.isFavorite!;
    }

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .40,
        child: widget.isGrade
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productImageDetail(context),
                  _productD(context),
                ],
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Row(
                  children: [
                    productImageDetail(context),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: _productD(context))
                  ],
                ),
              ),
      ),
    );
  }

  Widget productImageDetail(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(
              PageConstant.productDetail,
              arguments: FavoritProduct(
                  isFavorite: isFavorite, product: widget.loadedProducts)),
          child: Hero(
            tag: widget.loadedProducts,
            child: Container(
              width: 164,
              height: 133,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.loadedProducts.image,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
        Positioned(
            bottom: -30,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    submitProductToFavorite(widget.loadedProducts, isFavorite);
                  });
                },
                icon: isFavorite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border),
              ),
            )),
      ],
    );
  }

  Column _productD(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        _ratingbar(),
        Text(widget.loadedProducts.title),
        Text(
          widget.loadedProducts.category,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
              color: Theme.of(context).colorScheme.onSurface),
        ),
        _price(context)
      ],
    );
  }

  Widget _price(BuildContext context) {
    return Text(
      widget.loadedProducts.price.toString(),
      style:
          TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 14),
    );
  }

  Widget _ratingbar() {
    return Row(
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
        const SizedBox(width: 10),
        Text("(${widget.loadedProducts.rating.count})"),
      ],
    );
  }

  void submitProductToFavorite(Product prod, isFavorite) {
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
