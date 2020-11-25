class Payment {
  final BigInt id;
  final BigInt patientID; //Өвчтөний дугаар
  final BigInt hospitalID; //Эмнэлгийн дугаар
  final String mainUuid; //

  final double mainPrice; // нийт төлбөр
  final double price; // төлөх төлбөр
  final double discount; // хөнгөлөлт
  final Status discountStatus; // хөнгөлөлтийн төрөл
  final DateTime created; //Төлбөр хийгдсэн огноо

  Payment({
    this.id,
    this.patientID,
    this.hospitalID,
    this.mainUuid,
    this.mainPrice,
    this.price,
    this.discount,
    this.discountStatus,
    this.created,
  });
}

enum Status {
  insuranceDiscount, //даатгал
  organizationDiscount, //байгууллага
  outPatientDiscount, //Тасгийн хөнгөлөлт
  emergencyDiscount, //яаралтай хөнгөлөлт
}
