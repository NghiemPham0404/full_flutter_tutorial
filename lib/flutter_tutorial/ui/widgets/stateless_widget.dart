import "package:flutter/material.dart";

void main(){
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Center(
                child: MyWidget(false),
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// ignore: must_be_immutable
class MyWidget extends StatelessWidget{

  bool loading;

  MyWidget(this.loading, {super.key});

  @override
  Widget build(BuildContext context) {
    return loading ? CircularProgressIndicator(color: Colors.red,): Text("not loading");
  } 
}