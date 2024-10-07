import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/categpry_list_controller.dart';
import '../../state_holders/main_button_nav_controller.dart';
import '../widgets/category_items.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Category',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: RefreshIndicator(
          backgroundColor: Colors.teal,
          color: Colors.white,
          onRefresh: ()async{
            Get.find<CategoryListController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GetBuilder<CategoryListController>(
              builder: (controller)=>
              Visibility(
                visible: controller.inProgress==false,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8,
                ),
                itemCount: controller.categoryListModel.categoryList?.length??0,
                itemBuilder: (_, index){
                  return FittedBox(
                    child: CategoryItems(
                      categories: controller.categoryListModel.categoryList![index],
                    ),
                  );
                },
              ),)
            ),
          ),
        ),
      ),
    );
  }
}
