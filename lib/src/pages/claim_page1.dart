import 'package:flutter/material.dart';

import 'package:countdown/countdown.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class ClaimPage extends StatefulWidget {
    @override
    _ClaimPage createState() {
      return _ClaimPage();
    }
  }

class _ClaimPage extends State {

  int _selectedIndex = 0;
  

  int _duelCommandment = 50;
  bool _buttonDisable = false;

  String _buttonText = "Claim";

  void _onItemTapped(int index) {
  setState(() {
      _selectedIndex = index;
    });
  }  

  @override
  Widget build(BuildContext context) {
    _read();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[   
                _pageOne(),
                _boton(),
              ],
            ),
          )
        ],
      ),
    );
    
  }

  Widget _pageOne(){
      return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 65.0),
        child: Row(
          children: <Widget>[

            Expanded(
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Claim Energy', style: TextStyle(color: Colors.white, fontSize: 25.0)),
                      SizedBox( height: 7.0),
                      Row(
                        children: <Widget>[
                          Text('$_duelCommandment', style: TextStyle( fontSize: 20.0, color: Colors.white ) ),
                          Icon( Icons.flash_on, color: Colors.white, size: 30.0 ),                         
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.00,
                    child: Slider(
                      activeColor: Colors.pinkAccent,
                      value: _duelCommandment.toDouble(),
                      inactiveColor: Colors.pinkAccent,
                      min: 0,
                      max: 50,
                      label: '$_duelCommandment',
                        onChanged: null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
   
  }

  Widget _fondoApp(){

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );


    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ]
          )
        ),
      )
    );
    
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaRosa
        )
      ],
    );

  }

  Widget _boton() {
    return  Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 250.0,
      width: 250.0,
      child: OutlineButton(
        onPressed: _buttonDisable ? null : _claim,
        borderSide: BorderSide(width: 16.0, color: Colors.pinkAccent),
        highlightColor: Colors.pinkAccent,
        highlightedBorderColor: Colors.pinkAccent,
        child: Text('$_buttonText', style: TextStyle(fontSize: 40.0, color: Colors.white)), 
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(500.0)) 
      ),
    );
  }  

  _claim(){
    CountDown cd = CountDown(Duration(seconds : 100));
    var sub = cd.stream.listen(null);

    if(_duelCommandment <= 1){
      //_duelCommandment--;
    }else{
      _duelCommandment--;
    }
    

    // start your countdown by registering a listener
    sub.onData((Duration d) {
      setState(() {
        _buttonDisable = true;
        _buttonText = d.inSeconds.toString();
      }); 
    });

    _save(_buttonText);

    // when it finish the onDone cb is called
    sub.onDone(() {
      setState(() {
        _buttonText = "Claim";
        _buttonDisable = false;
      });   
    });
  }
  

  _read() async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'energy';
      final value = prefs.getInt(key) ?? 0;
      setState(() {
        _duelCommandment = value;
      });
      
  }
 
  _save(_buttonText) async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'energy';
      final value = _duelCommandment;
      final time = 'time';
      final timeleft = _buttonText;
      prefs.setInt(key, value);
      prefs.setString(time, timeleft);
      print('saved $value');
      print('saved $timeleft');
      }

}
