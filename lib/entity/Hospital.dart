class Hospital {
  final BigInt id;
  final String name; //Эмнэлгийн нэр
  final String addressUuid; //Эмнэлгийн хаяг
  final DateTime created; //Эмнэлгийг бүртгэж авсан огноо

  Hospital({this.id, this.name, this.addressUuid, this.created});
}
