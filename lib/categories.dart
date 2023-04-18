import 'dart:convert';

import 'package:flutter_application/drawer.dart';
import 'package:flutter_application/products.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<dynamic> _categories = [];

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://dummyjson.com/products/categories'));
      final json = jsonDecode(response.body);
      final results = json;
      setState(() {
        _categories = results;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      drawer: drawer(),
      body: 
      // Column(children: [
        // const Text("Categories"),
        ListView.builder(
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            return ListTile(
              onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => productList(category:category),),
              );
            },
              title: Text(category),
            );
          },
        ),
      // ],)
    );
  }
}
