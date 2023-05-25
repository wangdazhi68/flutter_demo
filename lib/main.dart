import 'package:flutter/material.dart';
// import 'package:flutter_demo/pages/init.dart';
// import 'package:flutter_demo/pages/row_cloumn.dart';
import 'package:flutter_demo/router/index.dart';
import 'package:flutter_demo/store/cart_list.dart';
import 'package:flutter_demo/store/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create:(ctx)=>CounterProvider()
        ),
        ChangeNotifierProvider(
          create:(ctx)=>CartList()
        ),
      ],
      child: Consumer(
          builder: (ctx, counterPro, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              // initialRoute: '/init',
              // routes:{
              //   '/init': (context) => const InitPage(title: 'Flutter Demo Home Page3'),
              //   '/row_cloumn': (context) =>const RowColumnPage(),
              // },
              //home: const InitPage(title: 'Flutter Demo Home Page1'),
              initialRoute: MyRouter.initialRoute,
              onGenerateRoute: (RouteSettings settings) {
                return MyRouter.onGenerateRoute(settings);
              }
              //routes:MyRouter.routes,
            );
          }
        ),
    );
  }
}

