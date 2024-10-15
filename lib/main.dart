import 'package:e_commerce_task/confige/route/on_generat_route.dart';
import 'package:e_commerce_task/confige/theme/app_theme.dart';
import 'package:e_commerce_task/core/navigation_bar/bottom_navigation_bar.dart';
import 'package:e_commerce_task/feature/bag/cubit/cubit/product_bag_cubit.dart';
import 'package:e_commerce_task/feature/favorite/cubit/cubit/favorite_product_cubit.dart';
import 'package:e_commerce_task/feature/products/bloc/products_bloc.dart';
import 'package:e_commerce_task/feature/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_task/feature/user/presentation/cubit/credentials/cubit/credentials_cubit.dart';
import 'package:e_commerce_task/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/injection_container.dart' as di;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => di.sl<AuthCubit>()..appStarted(),
          ),
          BlocProvider<CredentialsCubit>(
            create: (context) => di.sl<CredentialsCubit>(),
          ),
          BlocProvider<ProductBagCubit>(
            create: (context) => di.sl<ProductBagCubit>(),
          ),
          // BlocProvider<SingleUserCubit>(
          //   create: (context) => di.sl<SingleUserCubit>(),
          // ),
          BlocProvider<FavoriteProductCubit>(
            create: (context) => di.sl<FavoriteProductCubit>(),
          ),
          // BlocProvider<ProductCubit>(
          //   create: (context) => di.sl<ProductCubit>(),
          // )

          BlocProvider<ProductsBloc>(
            create: (context) => di.sl<ProductsBloc>(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-COMMERCE',
          theme: KAppTheme.lightTheme,
          initialRoute: '/',
          onGenerateRoute: OnGenerateRout.route,
          routes: {
            '/': (context) => const EBottomNavigationBarWidget(),
            //  BlocBuilder<AuthCubit,AuthState>(
            //   builder: (context, authState) {
            // if(authState is Authenticated){
            //   return  EBottomNavigationBarWidget(uid: authState.uid,);
            // }else{
            //   // return const AuthPage();
            //     EBottomNavigationBarWidget(uid: authState.uid,);
            // }
            //  return   const EBottomNavigationBarWidget();
            // },
            // )
          },
        ));
  }
}
