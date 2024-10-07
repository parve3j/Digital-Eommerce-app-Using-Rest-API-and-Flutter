import 'package:ecom_project_using_rest_api/data/model/categories.dart';
import 'package:ecom_project_using_rest_api/data/model/products.dart';

class ProductListModel {
  String? msg;
  List<Products>? productList;

  ProductListModel({this.msg, this.productList});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productList = <Products>[];
      json['data'].forEach((v) {
        productList!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.productList != null) {
      data['data'] = this.productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


