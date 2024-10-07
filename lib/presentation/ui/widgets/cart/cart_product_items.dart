import 'package:ecom_project_using_rest_api/presentation/state_holders/auth_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/utlity/asset_path.dart';
import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../../../data/model/carts.dart';
import '../../../state_holders/cart_delete_controller.dart';


class AddToCart extends StatefulWidget {
  Carts carts;
  AddToCart({
    super.key,
    required this.carts,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  ValueNotifier<int> noOfItems= ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(widget.carts.product?.image??'', width: 40, fit: BoxFit.cover,),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        widget.carts.product!.title ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                      ),),
                      GetBuilder<CartDeleteController>(
                        builder: (controller)=>
                        IconButton(
                          onPressed: (){
                          controller.deleteCart(AuthController.token??'', widget.carts.product!.id??0);
                        },
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Color: red'),
                      const SizedBox(width: 2),
                      Text('Size: ${widget.carts.size??''}'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${widget.carts.product!.price??''}',style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal
                      ),),
                      ValueListenableBuilder(
                        valueListenable: noOfItems,
                        builder: (context, value, _){
                          return ItemCount(
                            initialValue: value,
                            minValue: 0,
                            maxValue: 10,
                            decimalPlaces: 0,
                            color: Colors.teal,
                            onChanged: (v) {
                              noOfItems.value=v.toInt();
                            },
                          );
                        },
                      ),
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
