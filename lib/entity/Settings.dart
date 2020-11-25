class Settings {
  final BigInt id;
  final String uuid; //өөрийн нь давхардахгүй дугаар
  final String
      parentUuid; //харьялалыг тодотгоно. ЖШ: дүүргийг илэрхийж байгаа бол тухайн дүүргийн харьялагдах хотын uuid г хадгална.

  final String module;
  final String name;
  final String value;
  final String code;
  final String description;
  final int daraalal;

  Settings({
    this.id,
    this.uuid,
    this.parentUuid,
    this.module,
    this.name,
    this.value,
    this.code,
    this.description,
    this.daraalal,
  });
}
