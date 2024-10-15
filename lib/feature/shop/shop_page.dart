import 'package:e_commerce_task/feature/products/bloc/products_bloc.dart';
import 'package:e_commerce_task/feature/products/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool _isGrade = true;
  bool isSearchClicked = false;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: isSearchClicked ? _searchContainer(context) : Container(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                  if (_searchController.text.isNotEmpty) {
                    BlocProvider.of<ProductsBloc>(context).add(
                        LoadSearchedProducts(
                            searchQuery: _searchController.text));
                  }
                });
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Card(
        elevation: 0.0,
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.filter_list)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _isGrade = !_isGrade;
                      });
                    },
                    icon: _isGrade
                        ? const Icon(Icons.grid_view)
                        : const Icon(Icons.list)),
              ],
            ),
            Expanded(
              child: AllProducts(
                isProductScreenH: MediaQuery.of(context).size.height * .7,
                isGrade: _isGrade,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: TextFormField(
        controller: _searchController,
        autocorrect: true,
        decoration: InputDecoration(
            hintText: 'Search product',
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w200),
            suffixIcon: IconButton(
                onPressed: () {
                  _searchController.clear();
                },
                icon: const Icon(Icons.cancel_sharp))),
      ),
    );
  }
}
