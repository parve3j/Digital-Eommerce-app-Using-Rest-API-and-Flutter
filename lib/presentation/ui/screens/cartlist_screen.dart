import 'package:ecom_project_using_rest_api/data/model/carts.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/auth_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/cart_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/cart_delete_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart ';
import 'package:get/get.dart';

import '../../state_holders/main_button_nav_controller.dart';
import '../widgets/cart/cart_product_items.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<CartListController>().getAllCart(
      AuthController.token??'',
    );
    super.initState();
  }
  late Carts carts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(
          onPressed: () {
            Get.find<MainBottomNavController>().backHome();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.teal,
        color: Colors.white,
        onRefresh: () async{
          Get.find<CartDeleteController>().deleteCart(AuthController.token??'', carts.product!.id??0);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                child: GetBuilder<CartListController>(
                    builder: (controller) => Visibility(
                      visible: controller.inProgress==false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ListView.separated(
                            itemCount: controller.cartModel.cartList?.length??0,
                            itemBuilder: (context, index) {
                              return AddToCart(
                                carts: controller.cartModel.cartList![index],
                              );
                            },
                            separatorBuilder: (_, __) {
                              return SizedBox(height: 8);
                            },
                          ),
                        )),
              ),
              totallPriceandCheckOutSection
            ],
          ),
        ),
      ),
    );
  }

  Container get totallPriceandCheckOutSection {
    return Container(
      decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.15),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black45),
                ),
                Text(
                  '\$1023343434',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.teal),
                ),
              ],
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Check Out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
