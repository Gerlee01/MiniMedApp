class Prescription {
  final BigInt id;
  final String pillName; //Эмийн нэр
  final String diagnosis; //Онош

  final String rp; // тайлбар
  final String note; // тайлбар
  String parmokokinetik; // Фармакокинетик үйлдэл
  String parmakodinamik; // Фармакодинамик үйлдэл
  final String arga; // Хэрэглэх арга
  final String usedtun;
  final String usedtunMax; //Тун хэтэрсэн үед илрэх шинж, авах арга хэмжээ
  final String nuloo; // Гаж нөлөө
  final String tseerlelt; // Цээрлэлт
  String nemelt; // Нэмэлт мэдлэг
  final String uilchlel; // Үйлчлэл  Харилцан үйлчилгээ
  final String zaalt; // Хэрэглэх заалт
  String pregnantZaalt; //Жирэмсэн ба хөхүүл үеийн хэрэглээ
  final String olgoh; // Олгох нөхцөл
  final String hadgalah; // Хадгалах нөхцөл

  final String doctorFullName; //Жор бичсэн эмчийн бүтэн нэр
  final String doctorWorkPlace; //Жор бичсэн эмчийн ажлын байрны нэршил
  final String doctorRegNum; //Жор бичсэн эмчийн регистрийн дугаар
  final Type type; //Эмийн төрөл
  final DateTime created; //Жор бичсэн өдөр

  Prescription({
    this.id,
    this.pillName,
    this.diagnosis,
    this.rp,
    this.note,
    this.parmokokinetik,
    this.parmakodinamik,
    this.arga,
    this.usedtun,
    this.usedtunMax,
    this.nuloo,
    this.tseerlelt,
    this.nemelt,
    this.uilchlel,
    this.zaalt,
    this.pregnantZaalt,
    this.olgoh,
    this.hadgalah,
    this.doctorFullName,
    this.doctorWorkPlace,
    this.doctorRegNum,
    this.type,
    this.created,
  });

  String stringType() {
    switch (this.type) {
      case Type.normal:
        return 'Энгийн';
      case Type.setgets:
        return 'Сэтгэцэд нөлөөт';
      case Type.mansuuruulah:
        return 'Мансууруулах';
      default:
        return 'Тодорхойгүй';
    }
  }
}

enum Type {
  normal, //Энгийн
  setgets, //Сэтгэцэд нөлөөт
  mansuuruulah, //Мансууруулах
}
