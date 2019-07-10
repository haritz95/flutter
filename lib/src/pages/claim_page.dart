import 'package:flutter/material.dart';

import 'package:countdown/countdown.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClaimPage extends StatefulWidget {

  _ClaimPageState createState() => _ClaimPageState();
}

class _ClaimPageState extends State<ClaimPage> {

  bool _buttonDisable = false;
  String _buttonText = "Claim";

  int _duelCommandment = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 65.0),
        child: Column(
          children: <Widget>[
            SizedBox(
               child: Card(
                 elevation: 15,
                 margin: EdgeInsets.only(bottom: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      title: Text('My Balance'),
                      subtitle: Text('0.00000000 BTC'),
                      trailing: Icon(Icons.donut_large),
                    ),
                  ],
                ),
              ),
             ),
            Row(
            children: <Widget>[
              Expanded(
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Claim Energy', style: TextStyle(color: Colors.pink[300], fontSize: 25.0)),
                        SizedBox( height: 7.0),
                        Row(
                          children: <Widget>[
                            Text('$_duelCommandment', style: TextStyle( fontSize: 20.0, color: Colors.pink[300] ) ),
                            Icon( Icons.flash_on, color: Colors.pink[300], size: 30.0 ),                         
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
          _boton()
        ],
      ),
    );
  }

   Widget _boton() {
    return  Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 250.0,
      width: 250.0,
      child: OutlineButton(
        onPressed: _buttonDisable ? null : _claim,
        borderSide: BorderSide(width: 16.0, color: Colors.pink[300]),
        highlightColor: Colors.pink[300],
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