class MenuClass {
  String? productid;
  String? productname;
  String? productimage;
  String? productprice;
  String? productdesc;
  bool ?useSelctedItem =false;
 int itemCount=1 ;
 int totalsum=0;

  MenuClass(
      {this.productid,
        this.productname,
        this.productimage,
        this.productprice,
         this.useSelctedItem,
        this.productdesc,
        required this.totalsum,
        required this.itemCount,
      });

  MenuClass.fromJson(Map<String, dynamic> json) {
    productid = json['Productid'];
    productname = json['Productname'];
    productimage = json['Productimage'];
    productprice = json['Productprice'];
    productdesc = json['Productdesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Productid'] = this.productid;
    data['Productname'] = this.productname;
    data['Productimage'] = this.productimage;
    data['Productprice'] = this.productprice;
    data['Productdesc'] = this.productdesc;
    return data;
  }
}
