class Prescription {
  final BigInt id; //Давхардахгүй дугаар
  final BigInt patientID; //Өвчтөний дугаар
  final BigInt hospitalID; //Эмнэлгийн дугаар
  final String pillName; //Эмийн нэр
  final String rp;// тайлбар эмийн нэрс болон хэрэглэх заавар г.м
  final String note;// тайлбар эмийн нэрс болон хэрэглэх заавар г.м
  final String doctorFullName; //Жор бичсэн эмчийн бүтэн нэр
  final String doctorWorkPlace; //Жор бичсэн эмчийн ажлын байрны нэршил
  final String doctorRegNum; //Жор бичсэн эмчийн регистрийн дугаар
  final Type type; //Эмийн төрөл
  final DateTime created; //Цаг өгөгдсөн огноо

  Prescription({
    this.id,
    this.patientID,
    this.hospitalID,
    this.pillName,
    this.rp,
    this.note,
    this.doctorFullName,
    this.doctorWorkPlace,
    this.doctorRegNum,
    this.type,
    this.created,
  });
}

enum Type {
  normal, //Энгийн
  setgets, //Сэтгэцэд нөлөөт
  mansuuruulah, //Мансууруулах
}
