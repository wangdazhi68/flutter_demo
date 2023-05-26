import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/storage.dart';
import 'dart:convert';
class LocalstoragePage extends StatefulWidget {
  const LocalstoragePage({super.key,this.title});
  final String? title;

  @override
  State<LocalstoragePage> createState() => _LocalstoragePageState();
}

class _LocalstoragePageState extends State<LocalstoragePage> {
  String userName='';
  String sex='';
  String age='';
  String userInfoStr='';
  String keys='';
  Map<String, dynamic> userInfo = {
    "userName": "",
    "sex": "",
    "age": ''
  };

  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _uageController = TextEditingController();
  final TextEditingController _usexController = TextEditingController();

  static Storage storage = Storage();

  // 用户名
  setLocalName(){
    storage.setStorage('userName', _unameController.text);
  }
  getLocalName() async{
    String name =await storage.getStorage('userName')??'';
    setState(() {
      userName=name;
    });
  }
  removeLocalName() async{
    dynamic bool =await storage.removeStorage('userName');
    if(bool){
      setState(() {
        userName='';
      });
    }
  }
  //用户信息
  setLocalInfo(){
    Map<String, dynamic> userInfo1={
      'userName':_unameController.text,
      'age':_uageController.text,
      'sex':_usexController.text,
    };
    storage.setStorage('userInfo', userInfo1);
  }
  getLocalInfo() async{
    dynamic info =await storage.getStorage('userInfo');
    setState(() {
      userInfoStr=json.encode(info);
    });
  }

  getLocalKeys() async{
    Set<String> key=await storage.getKeys();
    setState(() {
      keys=key.toString();
    });
  }

  clearLocal() async{
    dynamic isClear=await storage.clear();
    if(isClear){
      setState(() {
        userName='';
        userInfoStr='';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body:Container(
        child:SingleChildScrollView(
          child:Column(
            children:[
              TextField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                  hintText: "用户名或邮箱",
                  labelText: "用户名",
                  prefixIcon: Icon(Icons.person)
                ),
              ),

              TextField(
                autofocus: true,
                controller: _usexController,
                decoration: InputDecoration(
                  hintText: "用户性别",
                  labelText: "性别",
                  prefixIcon: Icon(Icons.face)
                ),
              ),

              TextField(
                autofocus: true,
                controller: _uageController,
                decoration: InputDecoration(
                  hintText: "用户年龄",
                  labelText: "年龄",
                  prefixIcon: Icon(Icons.military_tech),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child:Container(
                  child:Column(
                    children:[
                      Text(
                        '当前的用户名是：',
                        style:TextStyle(
                          color:Colors.blue,
                          fontSize:18.0
                        ),
                      ),
                      Text(
                        '${userName}',
                        style:TextStyle(
                          color:Colors.blue,
                          fontSize:28.0
                        ),
                      ),

                      Text(
                        '当前的用户信息是：',
                        style:TextStyle(
                          color:Colors.blue,
                          fontSize:18.0
                        ),
                      ),
                      Text(
                        '${userInfoStr}',
                        style:TextStyle(
                          color:Colors.blue,
                          fontSize:20.0
                        ),
                      ),

                      Text(
                        '当前的全部缓存key有：',
                        style:TextStyle(
                          color:Colors.blue,
                          fontSize:18.0
                        ),
                      ),
                      Text(
                        '${keys}',
                        style:TextStyle(
                          color:Colors.blue,
                          fontSize:20.0
                        ),
                      ),

                      Container(
                        padding:const EdgeInsets.all(20),
                        child:Column(
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:MaterialStateProperty.resolveWith((states) => Size(double.infinity,50))
                              ),
                              onPressed: () {
                                setLocalName();
                              },
                              child:const Text("设置储存（用户名）"),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:MaterialStateProperty.resolveWith((states) => Size(double.infinity,50))
                              ),
                              onPressed: () {
                                getLocalName();
                              },
                              child:const Text("获取储存（用户名）"),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:MaterialStateProperty.resolveWith((states) => Size(double.infinity,50))
                              ),
                              onPressed: () {
                                removeLocalName();
                              },
                              child:const Text("删除储存（用户名）"),
                            ),

                            const SizedBox(height: 15),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:MaterialStateProperty.resolveWith((states) => Size(double.infinity,50))
                              ),
                              onPressed: () {
                                setLocalInfo();
                              },
                              child:const Text("设置储存（用户信息）"),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:MaterialStateProperty.resolveWith((states) => Size(double.infinity,50))
                              ),
                              onPressed: () {
                                getLocalInfo();
                              },
                              child:const Text("获取储存（用户信息）"),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:MaterialStateProperty.resolveWith((states) => Size(double.infinity,50))
                              ),
                              onPressed: () {
                                getLocalKeys();
                              },
                              child:const Text("获取所有key"),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:MaterialStateProperty.resolveWith((states) => Size(double.infinity,50))
                              ),
                              onPressed: () {
                                clearLocal();
                              },
                              child:const Text("清除所有缓存"),
                            ),
                          ],
                        )
                      )

                    ]
                  )
                ) ,
              )

            ]
          )
        )
      )
    );
  }
}