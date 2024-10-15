// import 'package:ecommerce_app/feature/user/domain/entity/user_entity.dart';
// import 'package:ecommerce_app/feature/user/presentation/cubit/single_user/cubit/single_user_cubit.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_task/feature/bag/view/bag_page.dart';
import 'package:e_commerce_task/feature/favorite/view/favorite.dart';
import 'package:e_commerce_task/feature/shop/shop_page.dart';
// import 'package:e_commerce_task/feature/user/presentation/pages/profile/profile_page.dart';

import '../../feature/home/home.dart';

import 'package:flutter/material.dart';

class EBottomNavigationBarWidget extends StatefulWidget {
  // final String uid;
  const EBottomNavigationBarWidget(
      {
      // required this.uid,
      super.key});

  @override
  State<EBottomNavigationBarWidget> createState() =>
      _EBottomNavigationBarWidgetState();
}

class _EBottomNavigationBarWidgetState
    extends State<EBottomNavigationBarWidget> {
  int _pageIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    ShopPage(),
    BagPage(),
    FavoritePage(),
    // ProfilePage()
  ];

  @override
  void initState() {
    // BlocProvider.of<SingleUserCubit>(context).getSingleUser(UserEntity(uid: widget.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          elevation: 0,
          iconSize: 40,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          showSelectedLabels: true,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home_outlined
                  // ,color: Colors.grey
                  ,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: 'Shop'),
            BottomNavigationBarItem(
                label: 'Bag',
                icon: Icon(
                  Icons.badge_outlined,
                )),
            BottomNavigationBarItem(
                label: 'Favorite', icon: Icon(Icons.favorite_border)),
            // BottomNavigationBarItem(
            //     label: 'Profile', icon: Icon(Icons.person_2_outlined)),
          ],
        ));
  }
}
