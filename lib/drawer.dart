import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/categories.dart';
import 'package:flag/flag.dart';

class drawer extends StatefulWidget {
  drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 176, 220, 220),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          builderHeader(context),
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
                children:  [
                  ListTile( leading:const Text('language',style: TextStyle(fontSize: 20,)).tr()),
                  const Divider(color: Colors.black),
                ],
              )
          ),
          ListTile(
            leading:  Flag.fromCode(width:40,FlagsCode.TH),
            title: Text('th'.tr()),
            onTap: () => setState(() {
                context.setLocale(Locale('th'));      
            }),
          ),
          ListTile(
            leading:  Flag.fromCode(width:40,FlagsCode.GB),
            title: Text('eng'.tr()),
            onTap: () => setState(() {
                context.setLocale(Locale('en'));         
            }),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child:
              Column(
                children:  [
                  ListTile( leading:const Text('page',style: TextStyle(fontSize: 20,)).tr()),
                  const Divider(color: Colors.black),
                ],
              )
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.amber),
            title: Text('home'.tr()),
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => CategoriesScreen(),))
          )
        ],
      );
}
