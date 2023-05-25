import 'package:flutter/material.dart';
import 'package:flutter_demo/model/product_list.dart';
import 'package:flutter_demo/store/cart_list.dart';
import 'package:provider/provider.dart';


class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key,this.title});
  final String? title;

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  ProductList productList = ProductList.init();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title!),
        actions: [
          IconButton(
            icon:const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          )
        ],
      ),
      body: Consumer<CartList>(
        builder: (ctx, cartData, child) {
          return ListView.builder(
            itemCount: productList.list.length,
            itemBuilder: (context, index) {
              bool isInCart =cartData.cartList.any(
                (element) => element == productList.list[index],
              );
              return ListTile(
                leading: Image.network(
                  'http://www.tangguoketang.com/img/banner01.7c3681ef.png',
                  width: 100,
                ),
                title: Text('${productList.list[index].name}'),
                trailing: isInCart
                  ? 
                  Icon(Icons.check) 
                  : 
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      cartData.add(productList.list[index]);
                      // Provider.of<CartList>(context, listen: false)
                      //     .add(productList.list[index]);
                    },
                  ),
              );
            }
          );
        }
      ),
      floatingActionButton: Consumer<CartList>(
        builder: (ctx, cartData, child) {
          return FloatingActionButton(
            // onPressed: _incrementCounter,
            onPressed:(){
              // Provider.of<CartList>(context, listen: false).removeAll();
              // cartData.removeAll();
              Navigator.of(context).pushNamed('/cart');
            },
            child: Text(
              // '${Provider.of<CartList>(context).cartList.length}'
              '${cartData.cartList.length}'
            ),
          ); // This trailing comma makes auto-formatting nicer for build methods.
        }
      )
    );
  }
}