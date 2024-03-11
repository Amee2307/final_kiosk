class TotalClass {
  String? totalAmount;
  String? tokenNo;
  String? tax;
  List<Data>? data;

  TotalClass({this.totalAmount, this.tokenNo, this.tax, this.data});

  TotalClass.fromJson(Map<String, dynamic> json) {
    totalAmount = json['total_amount'];
    tokenNo = json['token_no'];
    tax = json['tax'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_amount'] = this.totalAmount;
    data['token_no'] = this.tokenNo;
    data['tax'] = this.tax;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? productid;
  String? productqty;
  String? subTotal;
  String? otId;

  Data({this.productid, this.productqty, this.subTotal, this.otId});

  Data.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    productqty = json['productqty'];
    subTotal = json['sub_total'];
    otId = json['ot_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productid'] = this.productid;
    data['productqty'] = this.productqty;
    data['sub_total'] = this.subTotal;
    data['ot_id'] = this.otId;
    return data;
  }
}
