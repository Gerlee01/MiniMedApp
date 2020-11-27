class Patient {
  final int id;
  final String firstName; //Өөрийн нэр
  final String lastName; //Овог
  String cardNo; //Өвчтөний картын дугаар
  String mail; //Имэйл хаяг
  String phone; //Гар утасны дугаар
  final String regNum; //Регистрийн дугаар
  final String city;
  final String district;
  final String khoroo;
  String block; //Хороолол/гудамж
  String number; //Тоот
  String house; //Байр/хашаа
  DateTime created; //Өвчтөнийг бүртгэж авсан огноо

  Patient({
    this.id,
    this.firstName,
    this.lastName,
    this.regNum,
    this.cardNo,
    this.mail,
    this.phone,
    created,
    this.city,
    this.district,
    this.khoroo,
    this.house,
    this.block,
    this.number,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      regNum: json['regNum'] as String,
      cardNo: json['cardNo'] as String,
      mail: json['mail'] as String,
      phone: json['phone'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      khoroo: json['khoroo'] as String,
      house: json['house'] as String,
      block: json['block'] as String,
      number: json['number'] as String,
      created: json['created'] as String,
    );
  }
}
