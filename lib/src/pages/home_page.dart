import 'package:flutter/material.dart';

import 'package:btc_faucet/src/pages/claim_page.dart';
import 'package:btc_faucet/src/pages/balance_page.dart';
import 'package:btc_faucet/src/pages/settings_page.dart';

class BtcApp extends StatefulWidget {
  _BtcApp createState() => _BtcApp();
}

class _BtcApp extends State<BtcApp> {

  int currentIndex = 1;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _bottomNavigationBar(),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _callPage( int actualPage){

    switch(actualPage){
      case 0: return MyBalance();
      case 1: return ClaimPage();
      case 2: return Settings();

      default: return ClaimPage();
    }
  }

  Widget _bottomNavigationBar(){

    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.black54,
      onTap: (index) {
        setState(() {
         currentIndex = index; 
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          title: Text('My Balance')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          title: Text('Claim')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings')
        )
      ],
    );

  }

}