import 'package:ecom_project_using_rest_api/presentation/state_holders/product_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/widgets/product_card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  final String? category;
  final int? categoryId;

  const ProductList({super.key, this.category, this.categoryId});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    // TODO: implement initState
    if (widget.categoryId != null) {
      Get.find<ProductController>().getProductList(catID: widget.categoryId!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category ?? 'Product'),
        ),
        body: GetBuilder<ProductController>(
          builder: (controller) => Visibility(
            visible: controller.inProgress == false,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Visibility(
              visible: controller.productListModel.productList?.isNotEmpty?? false,
              replacement: const Center(
                child: Text('No Data Found', style: TextStyle(
                  color: Colors.redAccent
                ),),
              ),
              child: GridView.builder(
                itemCount: controller.productListModel.productList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                      child: ProductCardItems(
                    products: controller.productListModel.productList![index],
                  ));
                },
              ),
            ),
          ),
        ));
  }
}
