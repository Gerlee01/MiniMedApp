import 'package:flutter/material.dart';
import 'package:mini_med_front/controller/PatientController.dart';
import 'package:mini_med_front/screens/profile_sub/payment_tabs_screen.dart';
import 'package:mini_med_front/screens/profile_sub/profile_detail.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  var patient;

  @override
  void initState() {
    PatientController controller = PatientController();
    controller.findPatient().then((patient) {
      if (patient != null) {
        setState(() {
          this.patient = patient;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.only(top: 50),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              Column(
                children: <Widget>[
                  Text(patient == null ? '' : '${patient.lastName} ${patient.firstName}'),
                  Text(patient == null ? '' : '${patient.phone}'),
                  Text(patient == null ? '' : '${patient.mail}'),
                  Text(patient == null ? '' : '${patient.cardNo}'),
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
              onPressed: () {
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
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ProfileDetail.routeName, arguments: patient);
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
          onTap: () {
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
