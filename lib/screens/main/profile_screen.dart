import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              Column(
                children: <Widget>[
                  Text('Овог нэр'),
                  Text('96969696'),
                  Text('gerleebatzorig25@gmail.com'),
                  Text('123456'),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.credit_card_rounded),
            title: Text('Төлбөрийн мэдээлэл харах'),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: (){},
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.create),
            title: Text('Хувийн мэдээлэл харах'),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: (){},
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.translate_sharp),
            title: Text('Change Language'),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/');
          },
          child: Card(
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Гарах'),
            ),
          ),
        ),
      ],
    );
  }
}
