import 'package:flutter/material.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                minimumSize:MaterialStateProperty.resolveWith((states) => const Size(double.infinity,50))
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/request");
              },
              child:const Text("网络请求"),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                minimumSize:MaterialStateProperty.resolveWith((states) => const Size(double.infinity,50))
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/shoppingCart");
              },
              child:const Text("Provider实现购物车demo"),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                minimumSize:MaterialStateProperty.resolveWith((states) => const Size(double.infinity,50))
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/localstorage");
              },
              child:const Text("本地储存"),
            ),
          )
        ],
      ),
    );
  }
}