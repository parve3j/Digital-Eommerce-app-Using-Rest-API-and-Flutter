import 'package:ecom_project_using_rest_api/data/model/products.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/product_details_scren.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utlity/asset_path.dart';
class ProductCardItems extends StatelessWidget {
  final Products products;
  const ProductCardItems({
    super.key,
    required this.products
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductDetailsScreen(productID:products.id));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.network(
                  fit: BoxFit.cover,
                  products.image??'', width: 120,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(products.title.toString()??'',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ ${products.price??''}',style: const TextStyle(
                        fontSize: 12,
                        color: Colors.teal,
                        fontWeight: FontWeight.w600,
                      ),),
                      const SizedBox(width: 8,),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber,),
                          Text(products.star.toString()??'', style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ))
                        ],
                      ),
                      const SizedBox(width: 8,),
                      Card(
                        color: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Icon(Icons.favorite_outline_rounded,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
