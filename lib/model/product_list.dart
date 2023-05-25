
import 'package:flutter_demo/model/product.dart';

class ProductList {
  List<Product> list = <Product>[];
  ProductList.init() {
    for (var i = 0; i < 20; i++) {
      var product = Product(id: i, name: 'product-$i', price: i);
      list.add(product);
    }
  }
}