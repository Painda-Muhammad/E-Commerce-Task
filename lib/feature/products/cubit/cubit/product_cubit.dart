// import 'dart:convert';

// import 'package:e_commerce_task/core/constants/api_constants.dart';
// import 'package:e_commerce_task/feature/products/model/product_model.dart';
// import 'dart:developer';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// part 'product_state.dart';

// class ProductCubit extends Cubit<ProductState> {
//   ProductCubit() : super(ProductInitial());

//   /////////////////////////////////////////////////////////
//   List<Product> _allProducts = []; // Store all products after fetching
//   final List<Product> _paginatedProducts =
//       []; // Store products to display per page
//   int _currentPage = 1;
//   static const int _perPage = 6; // Number of products per page
//   bool hasReachedMax = false; // Flag to check if more products can be loaded

//   // Fetch all products once
//   Future<void> fetchAllProducts() async {
//     final url = Uri.parse('$kbaseUrl$kproducts');
//     try {
//       emit(ProductLoading());

//       final response = await http.get(url);
//       final jsonData = json.decode(response.body);

//       // Store all products fetched from API
//       _allProducts = (jsonData as List)
//           .map((productData) => Product.fromJson(productData))
//           .toList();
//       // log('$_allProducts');
//       // After fetching, load the first set of paginated products
//       paginateProducts(isInitialLoad: true);
//     } catch (_) {
//       emit(ProductFailure());
//     }
//   }

//   // Handle manual pagination
//   void paginateProducts({bool isInitialLoad = false}) {
//     if (hasReachedMax) return; // Stop loading if no more products are available
//     log('idIniyislixr : $isInitialLoad');

//     if (isInitialLoad) {
//       // Reset the pagination if this is the initial load
//       _currentPage = 1;
//       _paginatedProducts.clear();
//       log('h_paginatedProducts : $_paginatedProducts');

//       hasReachedMax = false;
//     }

//     // Calculate the start and end indices for the current page
//     int startIndex = (_currentPage - 1) * _perPage;
//     int endIndex = startIndex + _perPage;

//     log('startIndex : $startIndex');
//     log('endIndex : $endIndex');

//     // If there are more products to load
//     log('allProductlength${_allProducts.length}');
//     if (startIndex < _allProducts.length) {
//       // Add the next set of products to display
//       _paginatedProducts.addAll(
//         _allProducts.sublist(
//           startIndex,
//           endIndex > _allProducts.length ? _allProducts.length : endIndex,
//         ),
//       );
//       log('emit_paginatedProducts : $_paginatedProducts');
//       print('beforemit');
//       emit(ProductLoaded(products: List.from(_paginatedProducts)));
//       print('afteremit');
//       _currentPage++; // Move to the next page
//     } else {
//       // Mark as reached max when all products are loaded
//       hasReachedMax = true;
//       print('beforemit============');
//       emit(ProductLoaded(
//         products: List.from(_paginatedProducts),
//         hasReachedMax: true,
//       ));
//       print('afteremit=======');
//       log('hasReachMax_ : $hasReachedMax');
//     }
//   }

// //////////////////////////////////////////////////////////
//   final List<Product> _product = [];

//   Future<void> getProducts() async {
//     final url = Uri.parse('$kbaseUrl$kproducts');
//     try {
//       emit(ProductLoading());

//       final response = await http.get(url);
//       final jsondata = json.decode(response.body);

//       for (Map<String, dynamic> product in jsondata) {
//         _product.add(Product.fromJson(product));
//       }

//       emit(ProductLoaded(products: _product));
//     } catch (_) {
//       emit(ProductFailure());
//     }
//   }

//   Future<void> searchProduct(String query) async {
//     try {
//       if (query.isNotEmpty) {
//         emit(ProductLoading());
//         final searchedProduct = _product
//             .where((product) =>
//                 product.title.toLowerCase().contains(query) ||
//                 product.category.contains(query.toLowerCase()))
//             .toList();
//         // _product.add(searchedProduct as Product);
//         emit(ProductLoaded(products: searchedProduct));
//       } else {
//         await getProducts();
//       }
//     } catch (_) {
//       emit(ProductFailure());
//     }
//   }
// }
