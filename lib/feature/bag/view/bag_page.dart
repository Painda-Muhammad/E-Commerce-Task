import 'package:e_commerce_task/core/commom_widgets/buttonContainer.dart';
import 'package:e_commerce_task/feature/bag/cubit/cubit/product_bag_cubit.dart';
import 'package:e_commerce_task/feature/bag/cubit/cubit/product_bag_state.dart';
import 'package:e_commerce_task/feature/bag/view/sucess_page.dart';
import 'package:e_commerce_task/feature/bag/widget/product_confrmation.dart';
import 'package:e_commerce_task/feature/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_task/feature/user/presentation/pages/credentials/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../products/model/product_model.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    print('_builed called');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bag',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<ProductBagCubit, ProductBagState>(
        builder: (context, state) {
          print("Bloc is called");
          if (state is ProductBagInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductBagLoaded) {
            return state.products.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              final bagProduct = state.products[index];

                              return _buildCartContent(
                                  context, bagProduct, index);
                            }),
                      ),
                      Text(
                        'Total Product Price : ${state.totalPrice.toStringAsFixed(3)}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ButtonContainer(
                          ontap: () {
                            showConfirmationDialog(
                                context: context,
                                products: state.products,
                                onConfirm: () {
                                  isUserLoggedIn(context);
                                });
                          },
                          title: 'CHECK OUT',
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: Text("NO Product Is Available in Cart"),
                  );
          } else if (state is ProductBagFailure) {
            return const Center(child: Text('error'));
          }
          return const Center(child: Text('error'));
        },
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, Product bagProduct, index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .70,
        child: Row(
          children: [
            Image.network(bagProduct.image,
                width: MediaQuery.of(context).size.width * .30),
            const SizedBox(
              width: 10,
            ),
            _buildCartDetail(context, bagProduct, index),
          ],
        ),
      ),
    );
  }

  Widget _buildCartDetail(BuildContext context, Product bagProduct, int index) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.7),
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: const Offset(0, 7))
            ]),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bagProduct.category,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: const Text('Remove'),
                        onTap: () {
                          context
                              .read<ProductBagCubit>()
                              .removeItemFromBag(bagProduct);
                        },
                      )
                    ];
                  },
                  icon: const Icon(Icons.more_vert),
                )
              ],
            ),
            Text(bagProduct.title),
            const SizedBox(
              height: 20,
            ),
            _buildIncDecButton(context, bagProduct, index)
          ],
        ),
      ),
    );
  }

  Row _buildIncDecButton(BuildContext context, Product bagProduct, index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7), // Shadow color
                      spreadRadius: 1,
                      blurRadius: 5, // Blur radius
                      offset: const Offset(0, 5), // Offset
                    ),
                  ]),
              child: IconButton(
                  onPressed: () {
                    // context
                    //     .read<ProductBagCubit>()
                    //     .decrementProduct(index);

                    BlocProvider.of<ProductBagCubit>(context)
                        .decrementProduct(bagProduct);
                  },
                  icon: const Icon(Icons.remove)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(bagProduct.count.toString(),
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7), // Shadow color
                      spreadRadius: 1,
                      blurRadius: 5, // Blur radius
                      offset: const Offset(0, 5), // Offset
                    ),
                  ]),
              child: IconButton(
                  onPressed: () {
                    // context
                    //     .read<ProductBagCubit>()
                    //     .incrementProduct(index);
                    BlocProvider.of<ProductBagCubit>(context)
                        .incrementProduct(bagProduct);
                  },
                  icon: const Icon(Icons.add)),
            ),
          ],
        ),
        const Spacer(),
        Expanded(
            child: Text(
          (bagProduct.price.toStringAsFixed(2)).toString(),
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ],
    );
  }

  void isUserLoggedIn(BuildContext context) async {
    final authState = BlocProvider.of<AuthCubit>(context).state;

    if (authState is Authenticated) {
      print('User is authenticated');
      // Perform navigation or any other action
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SucessPage()),
      );
    } else {
      print('User is unauthenticated');
      // Navigate to login page or show login dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    }
  }
}
