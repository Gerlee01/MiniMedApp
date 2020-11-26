class Hospital {
  final BigInt id;
  final String name; //Эмнэлгийн нэр
  final String city;
  final String district;
  final String khoroo;
  String block; //Хороолол/гудамж
  String number; //Тоот
  String house; //Байр/хашаа
  final DateTime created; //Эмнэлгийг бүртгэж авсан огноо

  Hospital({
    this.id,
    this.name,
    this.created,
    this.city,
    this.district,
    this.khoroo,
    this.house,
    this.block,
    this.number,
  });
}
