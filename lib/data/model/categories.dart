class Categories {
  int? id;
  String? categoryName;
  String? categoryImg;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
        this.categoryName,
        this.categoryImg,
        this.createdAt,
        this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['categoryImg'] = this.categoryImg;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
