class PrescriptionItem {
  String name;
  String category;
  int quantity;
  MyDate period;
  MyFrequency frequency;
  bool isBought;
  bool isDone;
  String place;
  String svg;

  PrescriptionItem(this.name, this.category, this.quantity, this.period,
      this.frequency, this.isBought, this.isDone, this.svg,
      {this.place});
}

class MyFrequency {
  String unit;
  int quantity;
  String description;

  MyFrequency(this.unit, this.quantity, this.description);
}

class MyDate {
  int year;
  int month;
  int day;

  MyDate(this.year, this.month, this.day);
}
