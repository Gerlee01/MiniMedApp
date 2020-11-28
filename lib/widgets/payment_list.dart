import 'package:flutter/material.dart';
import 'package:mini_med_front/controller/PaymentController.dart';
import 'package:mini_med_front/entity/Payment.dart';

class PaymentList extends StatefulWidget {
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

  String _getSubTitle(Payment payment) {
    String result = '';

    result += payment.discountPack != 0
        ? 'Багцын хөнгөлөлт ${payment.discountPack}\n'
        : '';
    result += payment.discountVip != 0
        ? 'Эрхийн хөнгөлөлт ${payment.discountVip}\n'
        : '';
    result += payment.discountEmergency != 0
        ? 'Яаралтай цагийн төрлийн хөнгөлөлт ${payment.discountEmergency}\n'
        : '';
    result += payment.discountOutPatient != 0
        ? 'Тасгийн хөнгөлөлт ${payment.discountOutPatient}\n'
        : '';
    result += payment.discountDiagnosis != 0
        ? 'A B C Z оношийн хөнгөлөлт ${payment.discountDiagnosis}\n'
        : '';
    result += payment.discountInsurance != 0
        ? 'Даатгалын хөнгөлөлт ${payment.discountInsurance}\n'
        : '';
    result += payment.discountRepeat != 0
        ? 'Давтан үзлэгийн хөнгөлөлт ${payment.discountRepeat}\n'
        : '';
    result += payment.discountFamily != 0
        ? 'Гэр бүлийн хөнгөлөлт ${payment.discountFamily}\n'
        : '';
    result += payment.discountPercent != 0
        ? 'Хувьчилсан буюу гараараа хөнгөлсөн ${payment.discountPercent}\n'
        : '';

    return result.isEmpty ? 'Хөнгөлөлт байхгүй' : result;
  }

  @override
  Widget build(BuildContext context) {
    return _payments == null
        ? Text('sorry')
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: ListView.builder(
              itemCount: _payments.length,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: _payments[index].getMainDiscount() == 0
                        ? Icon(
                            Icons.payments_outlined,
                            color: Theme.of(context).primaryColor,
                          )
                        : Icon(
                            Icons.payment,
                            color: Theme.of(context).accentColor,
                          ),
                    title: Text(
                        '${_payments[index].mainPrice} / ${_payments[index].price}'),
                    subtitle: Text(
                      _getSubTitle(_payments[index]),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          );
  }
}
