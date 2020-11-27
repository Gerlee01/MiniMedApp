class Prescription {
  final int id;
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

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      id: json['id'] as int,
      pillName: json['pillName'] as String,
      diagnosis: json['diagnosis'] as String,
      rp: json['rp'] as String,
      note: json['note'] as String,
      parmokokinetik: json['parmokokinetik'] as String,
      parmakodinamik: json['parmakodinamik'] as String,
      arga: json['arga'] as String,
      usedtun: json['usedtun'] as String,
      usedtunMax: json['usedtunMax'] as String,
      nuloo: json['nuloo'] as String,
      tseerlelt: json['tseerlelt'] as String,
      nemelt: json['nemelt'] as String,
      uilchlel: json['uilchlel'] as String,
      zaalt: json['zaalt'] as String,
      pregnantZaalt: json['pregnantZaalt'] as String,
      olgoh: json['olgoh'] as String,
      hadgalah: json['hadgalah'] as String,
      doctorFullName: json['doctorFullName'] as String,
      doctorWorkPlace: json['doctorWorkPlace'] as String,
      doctorRegNum: json['doctorRegNum'] as String,
      type: getTypeIndex(json['type'] as int),
      created: DateTime.parse(json['created'] as String),
    );
  }

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

Type getTypeIndex(int index){
  switch (index){
    case 0 : return Type.normal;
    case 1 : return Type.setgets;
    case 2 : return Type.mansuuruulah;
    default: return Type.normal;
  }
}
enum Type {
  normal, //Энгийн
  setgets, //Сэтгэцэд нөлөөт
  mansuuruulah, //Мансууруулах
}
