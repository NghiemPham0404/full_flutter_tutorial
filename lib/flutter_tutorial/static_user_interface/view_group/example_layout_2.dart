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

class MyWidget extends StatelessWidget {

  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt" 
      "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco" 
      "laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in" 
      "voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat" 
      "non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Ho_Chi_Minh_City_Skyline.jpg"), 
              fit:BoxFit.cover
            )
          ),
        ),
        Positioned(
          left : 10,
          right: 10,
          bottom: 20,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text("Ho Chi Minh City", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  Text(
                  text, 
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500, 
                    fontFamily: "SFPro"
                    //fontFamily: "Times New Roman"
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
