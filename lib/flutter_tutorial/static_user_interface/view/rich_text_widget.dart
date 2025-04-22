import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center( 
            child :MyWidget(),
          )
        )
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// TODO : display text with multiple style
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  // TODO : return the Text widget
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style : DefaultTextStyle.of(context).style,
        children: <TextSpan> 
        [
          TextSpan(text : "Hello "),
          TextSpan(text : "bold ", style : TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text : "World")
        ]
      ),
    );
  }
}