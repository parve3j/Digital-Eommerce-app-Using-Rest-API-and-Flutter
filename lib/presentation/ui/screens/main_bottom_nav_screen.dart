import 'package:ecom_project_using_rest_api/presentation/state_holders/popular_product_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/cartlist_screen.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/category_screen.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/home_screen.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/cart_controller.dart';
import '../../state_holders/categpry_list_controller.dart';
import '../../state_holders/home_banner_controller.dart';
import '../../state_holders/main_button_nav_controller.dart';
import '../../state_holders/new_product_controller.dart';
import '../../state_holders/special_product_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<HomeBannerController>().getBannerList();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<PopularProductListController>().getPopularList();
    Get.find<SpecialProductListController>().getSpecialProductList();
    Get.find<NewProductListController>().getNewProductList();
    super.initState();
  }
  final List<Widget> _screens= [
     const HomeScreen(),
     CategoryScreen(),
     CartListScreen(),
     const WishlistScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller)=>Scaffold(
        body: _screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          onTap: controller.changeIndex,
          items:const[
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carts'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: 'Wishlist'),
          ],
        ),

      ),
    );
  }
}
