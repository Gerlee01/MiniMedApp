import 'package:flutter/foundation.dart';
import 'package:mini_med_front/entity/Payment.dart';

class PaymentProvider with ChangeNotifier{
  List<Payment> _payments = [];

  List<Payment> get payments{
    return [..._payments];
  }
}