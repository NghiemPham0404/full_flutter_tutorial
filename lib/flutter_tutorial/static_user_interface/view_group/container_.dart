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

// Color
// child or childless
// size : width & height
// aligment : Aligment, ALigmentDiectional, FractionalOffset
// padding
// margin
// decoration : color, shapee, borderRadius, border
// transform


class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink[900], // color
      width: 100,
      height: 100, 
      // alignment: Alignment.center, // Align with Alignment.-(center, top, bottom, left, right, topLeft....)
      alignment: Alignment(-1 , 0),// align with coordinate (0,0) - center, (-1, 0) - left, (0, 1) - bottom...
      padding: EdgeInsets.all(10), // padding
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration( // decorationdecoration
        // color: Colors.pink[900],
        gradient: LinearGradient(
          colors: [const Color.fromRGBO(136, 14, 79, 1),  const Color.fromRGBO(255, 202, 40, 1)
          ],
          // transform: GradientRotation(2), // rotation the gradient, using the radian, 1 radian = 60 degree
          begin: Alignment(0, -1),
          end: Alignment(0, 1.5),
        ),
        shape : BoxShape.rectangle, // rectangle, circle
        borderRadius: BorderRadius.circular(30), // borderRadius
        border : Border.all(width: 2, color : const Color.fromRGBO(25, 118, 210, 1))
        ),
        transform: Matrix4.rotationZ(-1.5), // rotation by x, y ,z
        transformAlignment: Alignment.center, // make sure the container dont move when rotatez
        child: const Text("Nghiem", style: 
        TextStyle(color: Colors.white, fontSize: 16),
        ), // when it is childless, the size is depend 
          // on the parent, if it has child, the size 
          // is depend on the child                                                                      
    );
  }
}


