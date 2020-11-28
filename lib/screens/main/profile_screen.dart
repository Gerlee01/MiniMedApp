import 'package:flutter/material.dart';
import 'package:mini_med_front/controller/PatientController.dart';
import 'package:mini_med_front/screens/profile_sub/payment_tabs_screen.dart';
import 'package:mini_med_front/screens/profile_sub/profile_detail.dart';
import 'package:mini_med_front/util/MConstants.dart';

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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorLight,
              ],
            ),
          ),
          width: double.infinity,
          height: 220,
          padding: EdgeInsets.only(top: 60, right: 10, left: 10, bottom: 50),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                  size: 70,
                ),
                radius: 41,
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      patient == null
                          ? ''
                          : '${patient.lastName} ${patient.firstName}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    _buildTextAndIcon(
                      patient == null ? '' : '${patient.phone}',
                      Icons.phone,
                    ),
                    _buildTextAndIcon(
                      patient == null ? '' : '${patient.mail}',
                      Icons.mail,
                    ),
                    _buildTextAndIcon(
                      patient == null ? '' : '${patient.cardNo}',
                      Icons.attach_file,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.credit_card_rounded),
                    title: Text('Төлбөрийн мэдээлэл харах'),
                    trailing: IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(PaymentTabsScreen.routeName);
                      },
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.create),
                    title: Text('Хувийн мэдээлэл харах'),
                    trailing: IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            ProfileDetail.routeName,
                            arguments: patient);
                      },
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.translate_sharp),
                    title: Text('Change Language'),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      MConstants.setToken('');
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Гарах'),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextAndIcon(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
