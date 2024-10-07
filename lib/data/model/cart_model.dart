import 'package:ecom_project_using_rest_api/data/model/carts.dart';
import 'package:ecom_project_using_rest_api/data/model/products.dart';

class CardModel {
  String? msg;
  List<Carts>? cartList;

  CardModel({this.msg, this.cartList});

  CardModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartList = <Carts>[];
      json['data'].forEach((v) {
        cartList!.add(new Carts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.cartList != null) {
      data['data'] = this.cartList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


