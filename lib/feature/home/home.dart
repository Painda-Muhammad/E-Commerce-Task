import 'package:e_commerce_task/core/card/primary_gride_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              // BlocProvider.of<AuthCubit>(context).loggedOut();
            },
            icon: const Icon(Icons.logout)),
        Expanded(child: _buildTopBox(context)),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: _buildSaleBox(context)),
                      Expanded(child: _buildBlackBox(context)),
                    ],
                  ),
                ),
                Expanded(child: _buildHoodiesBox(context))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildTopBox(BuildContext context) {
  return PrimaryGridImage(
      imagePath: 'assets/images/image_1.png',
      childWidget: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'New collection',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            )),
      ));
}

PrimaryGridImage _buildSaleBox(BuildContext context) {
  return PrimaryGridImage(
    height: MediaQuery.of(context).size.height / 4,
    childWidget: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Summer sales',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
      ),
    ),
  );
}

PrimaryGridImage _buildBlackBox(BuildContext context) {
  return PrimaryGridImage(
      height: MediaQuery.of(context).size.height / 4,
      imagePath: 'assets/images/image_3.png',
      childWidget: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Black",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ));
}

PrimaryGridImage _buildHoodiesBox(BuildContext context) {
  return PrimaryGridImage(
    height: MediaQuery.of(context).size.height / 2,
    imagePath: 'assets/images/image_2.png',
    childWidget: Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "Men's hoodies",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    ),
  );
}
