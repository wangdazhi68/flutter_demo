
import 'package:flutter/material.dart';
import 'package:flutter_demo/http/index.dart';
// import 'package:flutter_demo/http/request.dart';
import 'package:flutter_demo/http/responseClass/shop_list.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key,this.title});
  final String? title;

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List<dynamic> resultData = [];
  static HttpRequest httpRequest = HttpRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text(widget.title!)),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: getData(),
          ),
          
          Container(
            width: double.infinity,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  // style: ButtonStyle(
                  //   minimumSize:MaterialStateProperty.resolveWith((states) => const Size(double.infinity,50))
                  // ),
                  onPressed: () {
                    // print('aaaa');
                    get();
                  },
                  child:const Text("获取数据"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getData () {
    List<Widget> list = [];
    for (var item in resultData) {
      list.add(
        Row(
          children: [
            Text('商品: ${item.categoryName}', style: const TextStyle(fontSize: 20),),
            Text('价格: ${item.goodsCount}', style: const TextStyle(fontSize: 20),)
          ],
        )
      );
    };
    var content = Column(
      children: list,
    );
    return content;
  }

  void get() async {
    // var result = await HttpUtils.get(path: '/demo/categories');
    var result = await httpRequest.request(
      path: '/demo/categories',
      method:HttpMethod.get  
    );

    ShopList shopList = ShopList.fromJson(result);
    setState(() {
      resultData = shopList.data!;
    });
  }
}