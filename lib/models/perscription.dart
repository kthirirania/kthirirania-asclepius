import 'package:asclepius/models/nested_reference.dart';
import 'package:asclepius/models/prescription_item.dart';

class Prescription {
  NestedReference doctor;
  String date;
  String place;
  List<PrescriptionItem> prescriptionItems;
  bool isFilledByDoctor;

  Prescription(
      {this.doctor,
      this.date,
      this.place,
      this.prescriptionItems,
      this.isFilledByDoctor});

  static List<Prescription> prescriptions = [
    new Prescription(
        doctor: new NestedReference(name: 'Sondes Kthiri', prefix: 'Dr.'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions,
        isFilledByDoctor: true),
    new Prescription(
        doctor: new NestedReference(name: 'Sondes Kthiri', prefix: 'Dr.'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions,
        isFilledByDoctor: true),
    new Prescription(
        doctor: new NestedReference(name: 'Sondes Kthiri', prefix: 'Dr.'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions,
        isFilledByDoctor: true),
    new Prescription(
        doctor: new NestedReference(name: 'Sondes Kthiri', prefix: 'Dr.'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions,
        isFilledByDoctor: true),
    new Prescription(
        doctor: new NestedReference(name: 'Sondes Kthiri', prefix: 'Dr.'),
        date: 'Monday, 12 March 2020',
        place: 'Cabinet Dr. Kthiri, 2010, Centre Medical Soukra, Ariana',
        prescriptionItems: PrescriptionItem.getPrescriptions,
        isFilledByDoctor: true),
  ];
}
