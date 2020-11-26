import 'package:flutter/material.dart';
import 'package:mini_med_front/providers/payment_provider.dart';
import 'package:provider/provider.dart';

class PaymentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final payments =
        Provider.of<PaymentProvider>(context, listen: false).payments;

    return payments == null
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
              itemCount: payments.length,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: payments[index].discount == 0
                        ? Icon(Icons.payments_outlined)
                        : Icon(Icons.payment),
                    title: Text(
                        '${payments[index].mainPrice} / ${payments[index].price}'),
                    subtitle: payments[index].discount == 0
                        ? Text('${payments[index].stringStatus()}')
                        : Text(
                            '${payments[index].stringStatus()}: ${payments[index].discount}'),
                  ),
                  Divider(),
                ],
              ),
            ),
          );
  }
}
