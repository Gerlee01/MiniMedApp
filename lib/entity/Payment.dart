import 'dart:core';

class Payment {
  final int id;
  final double price; // төлөх төлбөр
  double discountPack; // Багцын хөнгөлөлт // 1.
  double discountVip; // Эрхийн хөнгөлөлт // 2.
  double discountEmergency; // Яаралтай цагийн төрлийн хөнгөлөлт // 3.
  double discountOutPatient; // Тасгийн хөнгөлөлт // 4.
  double discountDiagnosis; // A B C Z оношийн хөнгөлөлт // 5.
  double discountInsurance; // Даатгалын хөнгөлөлт // 6.
  double discountRepeat; // Давтан үзлэгийн хөнгөлөлт // 7.
  double discountFamily; // Гэр бүлийн хөнгөлөлт // 8.
  double discountPercent; // Хувьчилсан буюу гараараа хөнгөлсөн 9.
  final double mainPrice; // Үндсэн дүн буюу хөнгөлөгдөөгүй дүн

  final DateTime created; //Төлбөр хийгдсэн огноо

  Payment({
    this.id,
    this.mainPrice = 0,
    this.price = 0,
    this.discountPack = 0,
    this.discountVip = 0,
    this.discountEmergency = 0,
    this.discountOutPatient = 0,
    this.discountDiagnosis = 0,
    this.discountInsurance = 0,
    this.discountRepeat = 0,
    this.discountFamily = 0,
    this.discountPercent = 0,
    this.created,
  });

  double getMainDiscount() {
    return discountDiagnosis +
        discountVip +
        discountPack +
        discountEmergency +
        discountOutPatient +
        discountRepeat +
        discountFamily +
        discountPercent +
        discountInsurance;
  }

  double getTotalDiscount() {
    return discountDiagnosis +
        discountVip +
        discountPack +
        discountEmergency +
        discountOutPatient +
        discountRepeat +
        discountFamily +
        discountPercent;
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] as int,
      mainPrice: json['mainPrice'] as double,
      price: json['price'] as double,
      discountPack: json['discountPack'] as double,
      discountVip: json['discountVip'] as double,
      discountEmergency: json['discountEmergency'] as double,
      discountOutPatient: json['discountOutPatient'] as double,
      discountDiagnosis: json['discountDiagnosis'] as double,
      discountInsurance: json['discountInsurance'] as double,
      discountRepeat: json['discountRepeat'] as double,
      discountFamily: json['discountFamily'] as double,
      discountPercent: json['discountPercent'] as double,
      created: DateTime.parse(json['created'] as String),
    );
  }
}
