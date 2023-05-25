import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/api/index.dart';
import 'package:flutter_demo/pages/api/localstorage.dart';
import 'package:flutter_demo/pages/api/request.dart';
import 'package:flutter_demo/pages/api/shoppingCart/cart.dart';
import 'package:flutter_demo/pages/api/shoppingCart/shopping_cart.dart';
import 'package:flutter_demo/pages/home.dart';
import 'package:flutter_demo/pages/demo/init.dart';
import 'package:flutter_demo/pages/component/row_cloumn.dart';

class MyRouter {
  static String initialRoute = '/';
  // 路由注册表
  static Map routes = {
    '/': (context, {arguments}) => const HomePage(title: '首页'),
    '/init': (context, {arguments}) => const InitPage(),
    '/row_cloumn': (context, {arguments}) =>const RowColumnPage(),
    '/api': (context, {arguments}) =>const ApiPage(),
    '/request': (context, {arguments}) =>const RequestPage(title: '网络请求'),
    '/shoppingCart': (context, {arguments}) =>const ShoppingPage(title: '商品列表'),
    '/cart': (context, {arguments}) =>const CartPage(title: '购物车'),
    '/localstorage': (context, {arguments}) =>const LocalstoragePage(title: '本地储存'),
  };
  // 路由参数
  static dynamic onGenerateRoute(RouteSettings settings) {
    String? name = settings.name;
    Function? pageContextBuilder = MyRouter.routes[name];
    if (pageContextBuilder != null) {
      if (settings.arguments != null) {
        Route route = MaterialPageRoute(
            builder: (context) =>
                pageContextBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        Route route = MaterialPageRoute(
            builder: (context) => pageContextBuilder(context));
        return route;
      }
    }
    return null;
  }
}