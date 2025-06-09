import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(child: Scaffold(body: _MyListView())),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class _MyListView extends StatelessWidget {
  final List<String> items = ['Apple', 'Banana', 'Orange', 'Mango'];

  @override
  Widget build(Object context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              "https://api.dicebear.com/9.x/initials/png?seed=" +
                  items[index][0] +
                  "&backgroundType=gradientLinear",
            ),
          ),
          title: Text(items[index]),
          subtitle: Text('This is ${items[index]}'),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
