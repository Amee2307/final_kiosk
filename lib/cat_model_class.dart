class CatClass {
  String? categoryId;
  String? categoryName;
  String? prodImg;
  String? imgurl;

  CatClass({this.categoryId, this.categoryName, this.prodImg, this.imgurl});

  CatClass.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    prodImg = json['prod_img'];
    imgurl = json['imgurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['prod_img'] = this.prodImg;
    data['imgurl'] = this.imgurl;
    return data;
  }
}
