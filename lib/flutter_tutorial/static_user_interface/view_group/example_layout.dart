import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold( 
          body: MyWidget(),
        )
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child : Column(
        spacing: 10,
        children: [
          Row(
            children: [
              SizedBox( 
                width: 80,
                child: Text("Username:", style: TextStyle(fontSize : 14, color: Colors.grey))
              ),
              Text("Nghiem123", style: TextStyle(fontSize : 14)
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 80, 
                child: Text("Email:", style: TextStyle(fontSize : 14, color: Colors.grey))
              ),
              Text("Nghiem@gmail.com", style: TextStyle(fontSize : 14)
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 80, 
                child: Text("Address:", style: TextStyle(fontSize : 14, color: Colors.grey))
              ),
              Text("Ho Chi Minh city, Vietnam", style: TextStyle(fontSize : 14)
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: ElevatedButton(onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                  ),
                  child: Text("Save", style: TextStyle(fontSize : 14, color: Colors.white))
                ),
              ),
              Expanded(
                child: OutlinedButton(onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.red)
                  ),
                  child: Text("Cancel", style: TextStyle(fontSize : 14, color: Colors.red))
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}