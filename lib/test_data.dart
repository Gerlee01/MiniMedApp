import 'package:flutter/material.dart';

import './entity/History.dart' as h;
import './entity/Prescription.dart' as p;

var pillData = [
  p.Prescription(
    id: BigInt.one,
    patientID: BigInt.one,
    hospitalID: BigInt.one,
    pillName: 'em',
    guide: 'haha',
    doctorFullName: 'doctor name',
    doctorWorkPlace: 'emch',
    doctorRegNum: 'yu12354678',
    type: p.Type.normal,
    created: DateTime.now(),
  ),
  p.Prescription(
    id: BigInt.two,
    patientID: BigInt.two,
    hospitalID: BigInt.two,
    pillName: 'em22',
    guide: 'haha',
    doctorFullName: 'doctor name',
    doctorWorkPlace: 'emch',
    doctorRegNum: 'yu12354678',
    type: p.Type.setgets,
    created: DateTime.now(),
  ),
  p.Prescription(
    id: BigInt.from(6),
    patientID: BigInt.from(6),
    hospitalID: BigInt.from(6),
    pillName: 'em3',
    guide: 'haha',
    doctorFullName: 'doctor name',
    doctorWorkPlace: 'emch',
    doctorRegNum: 'yu12354678',
    type: p.Type.mansuuruulah,
    created: DateTime.now(),
  ),
];

var historyData = [
  h.History(
    id: BigInt.one,
    historyUuid: 'uuid1',
    patientID: BigInt.one,
    hospitalID: BigInt.one,
    targetDate: DateTime.now(),
    targetTime: TimeOfDay.now(),
    targetNumber: 0,
    pdf: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    status: h.Status.active,
    type: h.Type.ambulatory,
    created: DateTime.now(),
  ),
  h.History(
    id: BigInt.two,
    historyUuid: 'uuid2',
    patientID: BigInt.two,
    hospitalID: BigInt.two,
    targetDate: DateTime.now(),
    targetTime: null,
    targetNumber: 2,
    pdf: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    status: h.Status.active,
    type: h.Type.analysis,
    created: DateTime.now(),
  ),
  h.History(
    id: BigInt.from(3),
    historyUuid: 'uuid3',
    patientID: BigInt.from(3),
    hospitalID: BigInt.from(3),
    targetDate: DateTime.now(),
    targetTime: TimeOfDay.now(),
    targetNumber: 4,
    pdf: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    status: h.Status.inactive,
    type: h.Type.pacs,
    created: DateTime.now(),
  ),
];