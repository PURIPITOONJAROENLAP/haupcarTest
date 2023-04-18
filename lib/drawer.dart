
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
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
        child:  Text('1', style: const TextStyle(color: Colors.white, fontSize: 20)),
      ));

  Widget builderMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.language, color: Colors.amber),
            title: const Text('Languase'),
            onTap: () => setState(() {
              // if (context.locale.languageCode == 'en') {
              //   context.setLocale(Locale('th'));
              // } else {
              //   context.setLocale(Locale('en'));
              // }
             
            }),
          ),
        ],
      );
}
