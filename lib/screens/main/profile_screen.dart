import 'package:flutter/material.dart';
import 'package:mini_med_front/screens/profile_sub/payment_tabs_screen.dart';
import 'package:mini_med_front/screens/profile_sub/profile_detail.dart';

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
              onPressed: (){
                Navigator.of(context).pushNamed(PaymentTabsScreen.routeName);
              },
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.create),
            title: Text('Хувийн мэдээлэл харах'),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: (){
                Navigator.of(context).pushNamed(ProfileDetail.routeName);
              },
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
