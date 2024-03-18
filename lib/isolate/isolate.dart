import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class isolate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Isolate",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 50,
            ),
            CupertinoButton(
                child: Text("Start without isolare"),
                onPressed: () {
                  withoutIsolateFun();
                },
                color: Colors.blue),
            SizedBox(
              height: 10,
            ),
            CupertinoButton(
                child: Text("Start with isolare"),
                onPressed: () {
                  IsolateFun();
                },
                color: Colors.blue),
          ],
        ),
      )),
    );
  }
}

IsolateFun() async{
   ReceivePort receivePort = ReceivePort();

   try{
     await Isolate.spawn(runTask,[receivePort.sendPort,4000000000]);
   }on Object{
    print("isolate faild");
    receivePort.close();
   }
  final res = await receivePort.first;
   print("Data Proccessed : $res");

}
int runTask(List<dynamic> args){

  SendPort sendPort = args[0];
  int value = 0 ;
  for(int i=0;i<args[1];i++){
    value++;
  }
  Isolate.exit(sendPort,value);
}

withoutIsolateFun(){

  int value = 0 ;
  for(int i=0;i<4000000;i++){
    value++;
  }
  print("Data Proccessed : $value");
}