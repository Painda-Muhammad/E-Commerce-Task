import 'package:e_commerce_task/feature/products/bloc/products_bloc.dart';

import 'package:e_commerce_task/feature/products/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({this.isProductScreenH, this.isGrade = false, super.key});
  final bool isGrade;
  final double? isProductScreenH;

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final _scrollController = ScrollController();

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll < maxScroll * .9) {
      BlocProvider.of<ProductsBloc>(context).add(LoadPaginatedProducts());
    }
  }

  @override
  void initState() {
    // Fetch all products initially

    BlocProvider.of<ProductsBloc>(context).add(LoadPaginatedProducts());

    _scrollController.addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          return state.products!.isEmpty
              ? RefreshIndicator(
                  child: const Center(child: Text('No Product in API')),
                  onRefresh: () async =>
                      // await BlocProvider.of<ProductCubit>(context)
                      //     .getProducts(),
                      BlocProvider.of<ProductsBloc>(context)
                          .add(LoadAllProducts()))
              : SizedBox(
                  height: deviceH * .7,
                  child: widget.isGrade
                      ? GridView.builder(
                          controller: _scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: state.products!.length + 1,
                          itemBuilder: (context, index) {
                            final productList = state.products;

                            if (index < state.products!.length) {
                              return ProductItem(
                                isGrade: widget.isGrade,
                                loadedProducts: productList![index],
                              );
                            } else {
                              return state.hasReachedMax == true
                                  ? Center(
                                      child: Text('No Data in list'),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    );
                            }
                          },
                        )
                      : _loadedProducts(deviceH, state),
                );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _loadedProducts(double dHeight, ProductsLoaded productState) {
    return SizedBox(
      height: dHeight * 7,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: productState.products!.length + 1,
          itemBuilder: (context, index) {
            if (index < productState.products!.length) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductItem(
                  isGrade: widget.isGrade,
                  loadedProducts: productState.products![index],
                ),
              );
            } else {
              return productState.hasReachedMax == true
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text('No Data in list'),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
            }
          }),
    );
  }
}
