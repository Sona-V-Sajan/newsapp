import 'package:flutter/material.dart';
import 'package:news_application/controller/homecontroller.dart';
import 'package:news_application/view/homepage/homepage.dart';
import 'package:news_application/view/splashpage/splashpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeController())
        ],
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
  }
}
