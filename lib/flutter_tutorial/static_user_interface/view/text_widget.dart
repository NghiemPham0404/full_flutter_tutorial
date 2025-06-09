import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(child: Scaffold(body: MyWidget())),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWidget extends StatelessWidget {
  // TODO style
  final TextStyle myStyle = TextStyle(
    color: Colors.pink, // set color of texts
    backgroundColor: Colors.amberAccent[100], // set bg color of texts
    fontSize: 13, // set fontsize for text
    fontWeight: FontWeight.w500, // set font weight, bold
    fontStyle: FontStyle.italic, // fontstyle - normal, italic
    fontFamily:
        "SFPro", // set font family, some fonts need to be put in assets folder and declare
    // inside the
    wordSpacing: 5, // set space between word
    decoration:
        TextDecoration
            .lineThrough, // text decoration - underline, overline, lineThrough (strike)
    decorationColor: Colors.pink,
    decorationThickness: 2,
  );

  MyWidget({super.key});

  // TODO : return the Text widget
  @override
  Widget build(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
      "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"
      "laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in"
      "voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat"
      "non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      textDirection: TextDirection.ltr, // TODO : text direction
      textAlign:
          TextAlign
              .justify, // TODO : text align -  center, justify, start, end, left, right
      maxLines:
          3, // TODO : set text maximum lines, if texts are overflow, they will be chip (hidden)
      //by default
      overflow:
          TextOverflow
              .clip, // TODO : set text overflow behavior - clip (hidden), ecllipsis (...),
      // fade, visible
      textScaler: TextScaler.linear(1.5), // TODO : scale the text content
      style: myStyle,
    );
  }
}
