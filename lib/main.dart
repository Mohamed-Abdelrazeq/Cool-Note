//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Providers
import 'Controllers/PageProvider.dart';
//Screens
import 'Views/Screens/AddNoteScreen.dart';
import 'Views/Screens/MyHomePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(create: (_) => PageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/AddNoteScreen': (context) => AddNoteScreen(),
      },
      home: MyHomePage(),
    );
  }
}


