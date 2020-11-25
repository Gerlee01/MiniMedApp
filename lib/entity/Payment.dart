class Payment {
  final BigInt id;
  final BigInt patientID; //Өвчтөний дугаар
  final BigInt hospitalID; //Эмнэлгийн дугаар
  final int price; //Төлбөр
  final Type type; //Төлбөрийн төрөл
  final DateTime created; //Төлбөр хийгдсэн огноо

  Payment({
    this.id,
    this.patientID,
    this.hospitalID,
    this.price,
    this.type,
    this.created,
  });
}

enum Type {
  person, //Өөрөө
  clinic, //Тасгийн хөнгөлөлт
  diagnosis, //Оношийн хөнгөлөлт
}
