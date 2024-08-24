import

'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_application/controller/homecontroller.dart';
import 'package:news_application/view/homepage/homepage.dart';
import 'package:news_application/view/login&registerpage/login_and_register.dart';
import 'package:news_application/view/registerationpage/registrationpage.dart';
import 'package:news_application/view/splashpage/splashpage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            MaterialApp(debugShowCheckedModeBanner: false, home: Splashpage()));
  }
}
