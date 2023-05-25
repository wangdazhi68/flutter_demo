import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/storage.dart';

class LocalstoragePage extends StatefulWidget {
  const LocalstoragePage({super.key,this.title});
  final String? title;

  @override
  State<LocalstoragePage> createState() => _LocalstoragePageState();
}

class _LocalstoragePageState extends State<LocalstoragePage> {
  String userName = '';
  dynamic userInfo={};
  final TextEditingController _unameController = TextEditingController();
  static Storage storage = Storage();

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body:Container(
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
                        fontSize:38.0
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
    );
  }
}