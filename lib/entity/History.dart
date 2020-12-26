
import 'package:flutter/material.dart';

class History {
  final int id;
  final DateTime targetDate; //Цаг авсан өдөр
  final DateTime targetTime; //Авсан цаг
  final int targetNumber; //Авсан дугаар
  final String pdf; //Үзлэгийн дэлгэрэнгүй мэдээлэлтэй pdf файл
  final Status status; //Төлөв
  final Type type; //Төрөл
  final DateTime created; //Цаг өгөгдсөн огноо

  History({
    this.id,
    this.targetDate,
    this.targetTime,
    this.targetNumber,
    this.pdf,
    this.status,
    this.type,
    this.created,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id : json['id'] as int,
      targetDate : DateTime.parse(json['targetDate'] as String),
      targetTime : DateTime.parse(json['targetTime'] as String),
      targetNumber : json['targetNumber'] as int,
      pdf : json['pdf'] as String,
      status : getStatusIndex(json['status'] as int),
      type : getTypeIndex(json['type'] as int),
      created: DateTime.parse(json['created'] as String),
    );
  }

  String getTypeName(){
    switch (this.type){
      case Type.ambulatory : return 'Үзлэг';
      case Type.analysis : return 'Шинжилгээ';
      case Type.pacs : return 'Оношилгоо';
      default: return 'Тодорхойгүй';
    }
  }
}

Status getStatusIndex(int index){
  switch (index){
    case 0 : return Status.active;
    case 1 : return Status.inactive;
    default: return Status.active;
  }
}

Type getTypeIndex(int index){
  switch (index){
    case 0 : return Type.ambulatory;
    case 1 : return Type.analysis;
    case 2 : return Type.pacs;
    default: return Type.ambulatory;
  }
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