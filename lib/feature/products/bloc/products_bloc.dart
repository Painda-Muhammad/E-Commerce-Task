import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_task/core/shared_preference/UserPreferences.dart';
import 'package:e_commerce_task/feature/products/model/product_model.dart';
import 'package:e_commerce_task/feature/products/repositories/get_all_products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<LoadAllProducts>(_fetchAllProducts);
    on<LoadPaginatedProducts>(_paginatedProducts);
    on<LoadSearchedProducts>(_searchedProducts);
  }

  List<Product> _allProducts = []; // Store all products fetched from API

  static int _productLimit = 6; // Number of products per page
  bool hasReachedMax = false; // To check if we reached the end

  Future<void> _fetchAllProducts(
      LoadAllProducts event, Emitter<ProductsState> emit) async {
    try {
      emit(ProductsLoading());
      _allProducts = await getAllProducts();
      emit(ProductsLoaded(products: [..._allProducts]));
    } catch (e) {
      emit(ProductFailure(errMessage: 'Failed to load products: $e'));
    }
  }

  Future<void> _paginatedProducts(
      LoadPaginatedProducts event, Emitter<ProductsState> emit) async {
    if (state is ProductsLoaded && (state as ProductsLoaded).hasReachedMax) {
      return;
    }

    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      // Offline: Load products from the cache
      await _loadProductsFromCache(emit);
    } else {
      // Online: Fetch products from the API
      await getAllProducts(limit: "${_productLimit += 6}");
    }

    try {
      ProductsPreferences.clearSavedProduct();
      if (state is ProductsInitial) {
        final products = await getAllProducts(limit: '$_productLimit');

        // Cache new products in Sharedprefernce for offline access
        ProductsPreferences.saveUser(products);

        emit(ProductsLoaded(
            products: products,
            hasReachedMax: products.length < _productLimit));
      } else if (state is ProductsLoaded) {
        final currentState = state as ProductsLoaded;

        final products = await getAllProducts(limit: '${_productLimit += 6}');

        ProductsPreferences.saveUser(products);

        emit(products.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : ProductsLoaded(
                products: products,
                hasReachedMax: products.length < _productLimit,
              ));
      }
    } catch (e) {
      emit(ProductFailure(errMessage: 'Error  while loading product: $e'));
    }
  }

  // Load products from Hive (local cache) in offline mode
  Future<void> _loadProductsFromCache(Emitter<ProductsState> emit) async {
    var cachedProducts = await ProductsPreferences.getUser();
    print('loadfromoffline:$cachedProducts');
    if (cachedProducts != null) {
      emit(ProductsLoaded(products: cachedProducts, hasReachedMax: true));
    } else {
      emit(ProductFailure(
          errMessage:
              'unable to  load  from  Local storage')); // No cached data available
    }
  }

  FutureOr<void> _searchedProducts(
      LoadSearchedProducts event, Emitter<ProductsState> emit) async {
    try {
      if (event.searchQuery.isNotEmpty) {
        emit(ProductsLoading());
        _allProducts = await getAllProducts();
        final searchedProducts = _allProducts
            .where((product) =>
                product.title.toLowerCase().contains(event.searchQuery) ||
                product.category.contains(event.searchQuery.toLowerCase()))
            .toList();
        emit(ProductsLoaded(products: searchedProducts));
      } else {
        await _fetchAllProducts(LoadAllProducts(), emit);
      }
    } catch (e) {
      emit(ProductFailure(errMessage: 'Failed to search products: $e'));
    }
  }
}
