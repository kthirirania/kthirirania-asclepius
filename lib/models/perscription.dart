import 'package:asclepius/models/nested_reference.dart';
import 'package:asclepius/models/prescription_item.dart';

class Prescription {
  NestedReference doctor;
  String date;
  String place;
  List<PrescriptionItem> prescriptionItems;

  Prescription({this.doctor, this.date, this.place, this.prescriptionItems});

  static List<Prescription> prescriptions = [
    new Prescription(
        doctor: new NestedReference(name: 'Dr. Sondes Kthiri'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions),
    new Prescription(
        doctor: new NestedReference(name: 'Dr. Sondes Kthiri'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions),
    new Prescription(
        doctor: new NestedReference(name: 'Dr. Sondes Kthiri'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions),
    new Prescription(
        doctor: new NestedReference(name: 'Dr. Sondes Kthiri'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions),
    new Prescription(
        doctor: new NestedReference(name: 'Dr. Sondes Kthiri'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions),
  ];
}
