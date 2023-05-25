
class ShopList {
  int? code;
  String? msg;
  List<Data>? data;

  ShopList({this.code, this.msg, this.data});

  ShopList.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["msg"] is String) {
      msg = json["msg"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["msg"] = msg;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? categoryId;
  String? categoryName;
  String? goodsCount;

  Data({this.categoryId, this.categoryName, this.goodsCount});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["categoryId"] is String) {
      categoryId = json["categoryId"];
    }
    if(json["categoryName"] is String) {
      categoryName = json["categoryName"];
    }
    if(json["goodsCount"] is String) {
      goodsCount = json["goodsCount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["categoryId"] = categoryId;
    _data["categoryName"] = categoryName;
    _data["goodsCount"] = goodsCount;
    return _data;
  }
}