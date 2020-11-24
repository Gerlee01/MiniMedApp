
import 'package:flutter/material.dart';

class History {
  final BigInt id;
  final String historyUuid; //үзлэг,шинжилгээ, оношилгооний uuid
  final BigInt patientID; //Өвчтөний дугаар
  final BigInt hospitalID; //Эмнэлгийн дугаар
  final DateTime targetDate; //Цаг авсан өдөр
  final TimeOfDay targetTime; //Авсан цаг
  final int targetNumber; //Авсан дугаар
  final String pdf; //Үзлэгийн дэлгэрэнгүй мэдээлэлтэй pdf файл
  final Status status; //Төлөв
  final Type type; //Төрөл
  final DateTime created; //Цаг өгөгдсөн огноо

  History({
    this.id,
    this.historyUuid,
    this.patientID,
    this.hospitalID,
    this.targetDate,
    this.targetTime,
    this.targetNumber,
    this.pdf,
    this.status,
    this.type,
    this.created,
  });
}

enum Type {
  ambulatory, //"Үзлэг"
  analysis, //"Шинжилгээ"
  pacs, //"Оношилгоо"
}

enum Status {
  active, //Ирсэн
  inactive, //Ирээгүй
}
