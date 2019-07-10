import 'package:flutter/material.dart';

class MyBalance extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 65.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             SizedBox(  
               child: Card(
                 elevation: 15,
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
             SizedBox(
               child: Card(
                 elevation: 15,
                 //color: Colors.pink[300],
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     ListTile(
                      title: Text('Claimed'),
                      subtitle: Text('0.00000000 BTC'),
                      trailing: Icon(Icons.touch_app),
                     ),
                     Divider(),
                     ListTile(
                      title: Text('Referral'),
                      subtitle: Text('0.00000000 BTC'),
                      trailing: Icon(Icons.person_add),
                     )
                   ],
                 ),
               ),
             ),
             SizedBox(
               child: Card(
                 //color: Colors.pink[300],
                 child: Column(
                   children: <Widget>[
                     TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'BTC Waleet Address'
                      ),
                     ),                   
                   ],
                 ),
               ),
             ),  
             ButtonBar(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 ButtonTheme(
                   height: 50.0,
                   minWidth: 150,
                   child: RaisedButton(
                    child: Text('Withdraw', style: TextStyle(fontSize: 20.0),),
                    onPressed: () {},
                    color: Colors.pink[300],
                  )
                 ),
                 
               ],
             ) 
           ],
         )
      ),
    );
  }
}