import 'package:ecom_project_using_rest_api/data/model/product_details.dart';
import 'package:ecom_project_using_rest_api/data/model/products.dart';

class ProductDetailsModel {
  String? msg;
  List<ProductDetails>? ProductDeailsList;

  ProductDetailsModel({this.msg, this.ProductDeailsList});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      ProductDeailsList = <ProductDetails>[];
      json['data'].forEach((v) {
        ProductDeailsList!.add(new ProductDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.ProductDeailsList != null) {
      data['data'] = this.ProductDeailsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



