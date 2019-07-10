import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
       child: ListView(
         children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.question_answer),
                title: Text('FAQ'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.gavel),
                title: Text('Privacy Policy'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Email Us'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                //trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ),
         ],
      ),
    );
  }
}