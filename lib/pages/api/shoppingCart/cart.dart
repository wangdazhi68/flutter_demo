import 'package:flutter/material.dart';
import 'package:flutter_demo/store/cart_list.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key,this.title});
  final String? title;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title!),
      ),
      body: Consumer<CartList>(
        builder: (ctx, cartData, child) {
          return ListView.builder(
            itemCount: cartData.cartList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  'http://www.tangguoketang.com/img/banner01.7c3681ef.png',
                  width: 100,
                ),
                title: Text('${cartData.cartList[index].name}'),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    // Provider.of<CartList>(context, listen: false).remove(cartData.cartList[index]);
                    cartData.remove(cartData.cartList[index]);
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
              cartData.removeAll();
            },
            child:const Text('清空'),
          ); // This trailing comma makes auto-formatting nicer for build methods.
        }
      )
    );
  }
}