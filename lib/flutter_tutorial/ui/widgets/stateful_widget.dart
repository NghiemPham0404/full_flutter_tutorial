import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
        home : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text("App bar", style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.redAccent[400],
              ),
              body: Center(
                child: MyWidget(false),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
    )
  );
}

class MyWidget extends StatefulWidget{
  
  bool loading;

  MyWidget(this.loading);

  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<MyWidget>{

  late bool _isLoading;

  @override
  void initState(){ // initState run before build
    super.initState();
    _isLoading = widget.loading;
  }

  @override
  Widget build(BuildContext context) {
   return _isLoading ? 
   CircularProgressIndicator() : FloatingActionButton(onPressed: changeIsLoading);
  }

  void changeIsLoading(){

    setState(() {
      _isLoading = true;
    });

    print("click ${_isLoading}");
  }  
}
