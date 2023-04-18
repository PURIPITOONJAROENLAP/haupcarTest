import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/drawer.dart';
import 'package:http/http.dart' as http;

class productList extends StatefulWidget {
  const productList({Key? key, required this.category}) : super(key: key);

  final String category;
  @override
  State<productList> createState() => _productListState();
}

class _productListState extends State<productList> {
  late String category;
  List<dynamic> _products = [];
  @override
  void initState() {
    super.initState();
    category = widget.category;
    getProductList();
  }

  Future<void> getProductList() async {
    try {
      final response = await http
          .get(Uri.parse('https://dummyjson.com/products/category/$category'));
      final json = jsonDecode(response.body);
      final results = json['products'];
      setState(() {
        _products = results;
        print(_products);
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text(category)),
      ),
      drawer: drawer(),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final products = _products[index];
          return Container(
            height: 100,
            child: ListTile(
              leading: Image.network(products['images'][0],
                  fit: BoxFit.cover,
                  width:100 ,
                  height: 50,
                  ),
              title: Text(products["title"]),
              subtitle: Text(products["description"]),
            )
          );
        },
      ),
    );
  }
}
