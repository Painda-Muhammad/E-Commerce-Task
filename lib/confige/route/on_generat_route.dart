import 'package:e_commerce_task/core/constants/page_constant.dart';
import 'package:e_commerce_task/feature/products/model/favorite_model.dart';
// import 'package:e_commerce_task/feature/user/presentation/pages/credentials/forgot_password.dart';

import '../../feature/bag/view/sucess_page.dart';
import 'package:flutter/material.dart';

import '../../feature/product_detail/product_detail.dart';

class OnGenerateRout {
  static MaterialPageRoute route(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      // case PageConstant.forgotPassword:
      //   {
      //     return materialPageRout(widget: const ForgotPassword());
      //   }
      case PageConstant.productDetail:
        {
          if (arg is FavoritProduct) {
            return materialPageRout(
                widget: ProductDetail(
              favoriteProductModel: FavoritProduct(
                  isFavorite: arg.isFavorite, product: arg.product),
            ));
          } else {
            return materialPageRout(widget: const ErrorPage());
          }
        }
      case PageConstant.successPage:
        {
          return materialPageRout(widget: const SucessPage());
        }
      default:
        return materialPageRout(widget: const ErrorPage());
    }
  }
}

materialPageRout({required Widget widget}) {
  return MaterialPageRoute(
    builder: (context) => widget,
  );
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error Page'),
      ),
    );
  }
}
