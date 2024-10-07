import 'package:ecom_project_using_rest_api/presentation/ui/widgets/product_card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/main_button_nav_controller.dart';
class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        Get.find<MainBottomNavController>().backHome();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'WishList',
            style: TextStyle(fontSize: 18),
          ),
        ),
        // body: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //   child: GridView.builder(
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 3,
        //       mainAxisSpacing: 10,
        //       childAspectRatio: 0.7,
        //       crossAxisSpacing: 10,
        //     ),
        //     itemCount: 12,
        //     itemBuilder: (_, index){
        //       return  FittedBox(
        //         child: ProductCardItems(),
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }
}
