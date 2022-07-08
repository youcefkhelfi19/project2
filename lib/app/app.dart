import 'package:flutter/material.dart';
import 'package:project2/presentation/helper/app_theme.dart';

class App extends StatefulWidget {
   const App._internal ();
   static const App instance =  App._internal();
    factory App() => instance;
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
        home: Container());
  }
}
