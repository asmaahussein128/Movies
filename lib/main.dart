import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies/Controller/Api_Function.dart';
import 'package:movies/Viwes/Screens/Home_Screen.dart';
import 'package:provider/provider.dart';

import 'Controller/Api_Funcation_Popular.dart';

void main() {
  runApp(

    MultiProvider( child: MyApp(), providers: [
      ChangeNotifierProvider(
          create : (context){
            return Api()..getdata();
          }
  ),
      ChangeNotifierProvider(
          create : (context){
            return getpopulardata()..getdata();
          })

    ])

  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies",
      theme: ThemeData(primarySwatch: Colors.red,backgroundColor: Colors.black),
      home: AnimatedSplashScreen(
          duration: 3000,
          backgroundColor: Colors.white,
          splashIconSize: 5000,
          splash: Container(
            child: Image.asset('assent/Images/nnn.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover),
          ),
          nextScreen: HomeScreen()),
    );
  }
}
