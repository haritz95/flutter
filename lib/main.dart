import 'package:flutter/material.dart';

import 'package:btc_faucet/src/pages/home_page.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.pink[300],
      ),
      debugShowCheckedModeBanner: false,
      title: 'BTC Faucet',
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => BtcApp(),
      },
    );
  }
  
}