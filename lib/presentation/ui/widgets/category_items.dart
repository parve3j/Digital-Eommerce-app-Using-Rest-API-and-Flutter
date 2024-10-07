import 'package:ecom_project_using_rest_api/data/model/categories.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategoryItems extends StatelessWidget {
  Categories categories;
  CategoryItems({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> ProductList(category:categories.categoryName.toString(), categoryId: categories.id,));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: Colors.teal.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                height: 55,
                  width: 55,
                  image: NetworkImage(categories.categoryImg??''),
              ),
            ),
          ),
          Text(
            categories.categoryName.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.teal,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
