import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_task/feature/bag/cubit/cubit/product_bag_cubit.dart';
import 'package:e_commerce_task/feature/products/bloc/products_bloc.dart';

import 'package:e_commerce_task/feature/user/user_injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:e_commerce_task/feature/user/user_injection_container.dart';

import 'package:get_it/get_it.dart';

import 'favorite/cubit/cubit/favorite_product_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  // final firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => firestore);
  // sl.registerLazySingleton(() => firebaseStorage);

  await userInjectionContaier();

  //  adding product bag cubit
  sl.registerLazySingleton<ProductBagCubit>(() => ProductBagCubit());

  // adding the favorite cubit
  sl.registerLazySingleton<FavoriteProductCubit>(() => FavoriteProductCubit());

  // loading product form api
  // sl.registerLazySingleton<ProductCubit>(() => ProductCubit());
  sl.registerLazySingleton<ProductsBloc>(() => ProductsBloc());
}
