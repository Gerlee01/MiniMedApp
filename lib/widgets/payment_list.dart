import 'package:flutter/material.dart';
import 'package:mini_med_front/controller/PaymentController.dart';
import 'package:mini_med_front/entity/Payment.dart';

class PaymentList extends StatefulWidget{
  @override
  PaymentListSate createState() => PaymentListSate();
}

class PaymentListSate extends State<PaymentList> {
  List<Payment> _payments;
  @override
  void initState() {
    PaymentController controller = PaymentController();
    controller.findAll().then((payments) {
      if (payments != null) {
        setState(() {
          _payments = payments;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _payments == null
        ? Text('sorry')
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: ListView.builder(
              itemCount: _payments.length,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                      leading: _payments[index].getMainDiscount() == 0
                          ? Icon(Icons.payments_outlined)
                          : Icon(Icons.payment),
                      title: Text(
                          '${_payments[index].mainPrice} / ${_payments[index].price}'),
                      subtitle: Text('haha')),
                  Divider(),
                ],
              ),
            ),
          );
  }
}
