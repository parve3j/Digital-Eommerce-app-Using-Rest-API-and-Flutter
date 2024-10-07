import 'package:ecom_project_using_rest_api/presentation/state_holders/auth_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/product_details_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/cartlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../state_holders/add_to_card_controller.dart';
import '../widgets/product_details/color_selector.dart';
import '../widgets/product_details/product_image_carousel.dart';
import '../widgets/product_details/size_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  final productID;
  const ProductDetailsScreen({super.key, required this.productID});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productID);
  }
  Color? _selectedColor;
  String? _selectedSize;
  ValueNotifier<int> noOfItems= ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    List<Color> colors=[
      Colors.greenAccent,
      Colors.redAccent,
      Colors.blueAccent,
      Colors.yellowAccent,
      Colors.black54,
      Colors.lightGreenAccent,
    ];
    List<String> sizes=[
      's',
      'L',
      'M',
      'XL',
      'XXL',
    ];


    Color? getColorFromString(String color){
      switch (color.toLowerCase()){
        case 'red':
          return Colors.red;
        case 'green':
          return Colors.green;
        case 'white':
          return Colors.white;
        case 'blue':
          return Colors.blue;
        case 'black':
          return Colors.black;
        case 'yellow':
          return Colors.yellow;
        default:
          return null;
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          if(controller.inProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              ProductImageCaurosel(
                urls: [
                  controller.productDetails.img1??'',
                  controller.productDetails.img2??'',
                  controller.productDetails.img3??'',
                  controller.productDetails.img4??'',
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(controller.productDetails.product!.title??'',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis
                              ),
                            )),
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
                                    Get.find<ProductDetailsController>().update();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.star, size: 21, color: Colors.amber,),
                            const SizedBox(width: 5),
                            Text(controller.productDetails.product!.star.toString()??'', style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),),
                            const SizedBox(width: 5),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Text('Review', style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w600,
                                ),),

                                Card(
                                  color: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(Icons.favorite_outlined,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const Text('Color', style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),),
                      ColorSelector(
                          colors: controller.productDetails.color!
                              .split(',')
                              .map((color) => getColorFromString(
                                  color)) // Map to Color objects
                              .where((color) =>
                                  color != null) // Filter out null values
                              .cast<Color>() // Cast to List<Color>
                              .toList(),
                          onChange: (selectedColor) {
                            _selectedColor = selectedColor;
                          }),
                      const SizedBox(height: 8),
                        const Text('Size', style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),),
                        SizeSelector(sizes: controller.productDetails.size?.split(',')??[], onChange: (s){
                          _selectedSize=s;
                        }),
                        const SizedBox(height: 8,),
                        const Text('Description', style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),),
                      Text(controller.productDetails.des??'',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              priceandCheckOutSection(controller.productDetails.product!.price??0, noOfItems.value)
            ],
          );

        }
      ),
    );
  }

  Container priceandCheckOutSection(dynamic price, dynamic item) {

    return Container(
      decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
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
                const Text(
                  'Price',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black45),
                ),
                GetBuilder<ProductDetailsController>(
                  builder: (controller)=>
                  Text(
                    '\$${controller.CalculatePrice(price,item)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.teal),
                  ),
                ),
              ],
            ),
            SizedBox(
              child: GetBuilder<AddToCartControoler>(
                builder: (controller)=>
                Visibility(
                  visible: controller.inProgress==false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ElevatedButton(
                    onPressed: () async{
                      print("*****************************");
                      print(AuthController.token);
                      print("*****************************");
                      final response = await controller.addToCart(
                          AuthController.token!,
                          widget.productID,
                          _selectedColor!.toString(),
                          _selectedSize!,
                          noOfItems.value,
                      );
                      if(response){
                        Get.snackbar(
                          backgroundColor: Colors.teal,
                          'Success', 'Data Added',
                        );
                        const Duration(seconds: 2);
                      }else{
                        Get.snackbar(
                          backgroundColor: Colors.red,
                          'Failed', controller.errorMessage,
                        );
                      }
                      Get.to(()=>CartListScreen());
                    },
                    child: const Text('Add to Cart'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
