class Patient {
  final BigInt id;
  final String uuid;
  final String firstName; //Өөрийн нэр
  final String lastName; //Овог
  final String regNum; //Регистрийн дугаар
  final String addressUuid; //гэрийн хаяг
  final String cardNo; //Өвчтөний картын дугаар
  final String mail; //Имэйл хаяг
  final int phone; //Гар утасны дугаар
  final DateTime created; //Өвчтөнийг бүртгэж авсан огноо

  Patient({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.regNum,
    this.addressUuid,
    this.cardNo,
    this.mail,
    this.phone,
    this.created,
  });
}
