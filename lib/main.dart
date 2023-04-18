import 'package:flutter_application/categories.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(251, 164, 169, 168),
      ),
      home: CategoriesScreen(),
    );
  }
}
