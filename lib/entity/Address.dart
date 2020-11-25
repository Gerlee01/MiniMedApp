import 'package:mini_med_front/entity/Settings.dart';

class Address {
  final BigInt id;
  final String uuid;
  final Settings city;
  final Settings district;
  final Settings khoroo;
  final String block; //Хороолол/гудамж
  final String house; //Байр/хашаа
  final String number; //Тоот

  Address({
    this.id,
    this.uuid,
    this.city,
    this.district,
    this.khoroo,
    this.block,
    this.house,
    this.number,
  });
}
