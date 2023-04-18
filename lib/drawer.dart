import 'package:flutter/material.dart';
import 'package:flutter_application/categories.dart';

class drawer extends StatefulWidget {
  drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.white,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          builderHeader(context),
      
          // Container(
          //   width: 16,
          //   child: Text('language',style: TextStyle( fontSize: 20)),
          // ),
          builderMenuItems(context),
        ],
      )),
    );
  }

  Widget builderHeader(BuildContext context) => Container(
      color: Color.fromRGBO(59, 83, 163, 255).withOpacity(1),
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: const Center(
        child:  Text('Menu', style: const TextStyle(color: Colors.white, fontSize: 20)),
      ));

  Widget builderMenuItems(BuildContext context) => Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child:
              Column(
                children: const [
                  ListTile( leading:Text('language',style: TextStyle(fontSize: 20,))),
                  Divider(color: Colors.black),
                ],
              )
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.amber),
            title: const Text('ไทย'),
            onTap: () => setState(() {
              // if (context.locale.languageCode == 'en') {
              //   context.setLocale(Locale('th'));
              // } else {
              //   context.setLocale(Locale('en'));
              // }
             
            }),
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.amber),
            title: const Text('English'),
            onTap: () => setState(() {
              // if (context.locale.languageCode == 'en') {
              //   context.setLocale(Locale('th'));
              // } else {
              //   context.setLocale(Locale('en'));
              // }
             
            }),
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.amber),
            title: const Text('Home'),
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => CategoriesScreen(),))
          )
        ],
      );
}
