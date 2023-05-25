import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/store/counter.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});
    @override
    State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CounterProvider>(
        builder: (ctx, counterPro, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have clicked the button this many times:',
                ),
                Text(
                  '${counterPro.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextButton(
                  child: const Text("open new route"),
                  onPressed: () {
                    //导航到新路由   
                    Navigator.push( 
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const NewRoute();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      ),
      floatingActionButton: Consumer<CounterProvider>(
        builder: (ctx, counterPro, child) {
          return FloatingActionButton(
            // onPressed: _incrementCounter,
            onPressed:(){
              counterPro.counter += 1;
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ); // This trailing comma makes auto-formatting nicer for build methods.
        }
      )
    );
  }
}

class NewRoute extends StatelessWidget {
  const NewRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("New route"),
      ),
      body:Consumer<CounterProvider>(
         builder: (ctx, counterPro, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                    const Text(
                      'This is new route',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child:const Text(
                        '上一页的counter为：',
                        style:TextStyle(
                          color:Colors.blue,
                          fontSize:18.0
                        ),
                      ),
                    ),
                    Text(
                      '${counterPro.counter}',
                      style:TextStyle(
                        color:Colors.blue,
                        fontSize:38.0
                      ),
                    )
                ]
              )
            );
         }
      )
    );
  }
}
