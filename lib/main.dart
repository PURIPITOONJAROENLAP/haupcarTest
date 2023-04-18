import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application/categories.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale.fromSubtags(languageCode: "en"),
          Locale.fromSubtags(languageCode: "th"),
        ],
        path: 'assets/lang',
        fallbackLocale: const Locale.fromSubtags(languageCode: 'th'),
        startLocale: const Locale.fromSubtags(languageCode: 'th'),
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(251, 164, 169, 168),
      ),
      home: CategoriesScreen(),
    );
  }
}
