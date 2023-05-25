
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/api/index.dart';
import 'package:flutter_demo/pages/demo/init.dart';
import 'package:flutter_demo/pages/component/row_cloumn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  var pages = const [InitPage(), RowColumnPage(), ApiPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('首页'),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.extension), label: '组件'),
          BottomNavigationBarItem(icon: Icon(Icons.api), label: 'API'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
  
}
