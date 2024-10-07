import 'package:ecom_project_using_rest_api/data/model/banner.dart';

class BannerListModel {
  String? msg;
  List<Banners>? bannerList;

  BannerListModel({this.msg, this.bannerList});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      bannerList = <Banners>[];
      json['data'].forEach((v) {
        bannerList!.add(new Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.bannerList != null) {
      data['data'] = this.bannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

