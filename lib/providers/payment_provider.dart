import 'package:flutter/foundation.dart';
import 'package:mini_med_front/entity/Payment.dart';
import 'package:mini_med_front/test_data.dart';

class PaymentProvider with ChangeNotifier{
  List<Payment> _payments = paymentData.toList();

  List<Payment> get payments{
    return [..._payments];
  }
}