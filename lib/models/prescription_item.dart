class PrescriptionItem {
  String name;
  Category category;
  String note;
  int quantity;
  String unit;
  Period period;
  MyFrequency frequency;
  bool isBought;
  bool isDone;
  String place;
  List<String> images;
  List<String> tips;

  PrescriptionItem(
      {this.name,
      this.category,
      this.note,
      this.quantity,
      this.unit,
      this.period,
      this.frequency,
      this.isBought,
      this.isDone,
      this.images,
      this.place,
      this.tips});

  static List<PrescriptionItem> getPrescriptions = [
    new PrescriptionItem(
      name: 'Adderall',
      category: Category.bottle_of_pills,
      period: new Period(month: 2),
      quantity: 2,
      unit: 'Bottle',
      frequency: new MyFrequency(description: '1 Pill Each Morning'),
    ),
    new PrescriptionItem(
      name: 'Vitamine D Blood Test',
      category: Category.blood_analysis,
      quantity: 1,
      unit: 'Test',
      place: 'Zex Medical Center of Analysis',
      note: 'Take The Test In The Morning While Fasting',
    ),
    new PrescriptionItem(
      name: 'Vitamine E Injection',
      category: Category.syringe,
      period: new Period(day: 5),
      quantity: 5,
      place: 'At The Pharmacy Or The Red Croissant Agency',
      frequency: new MyFrequency(description: '1 Injection Per Day'),
      note: 'Better Take It At The End Of The Day',
    ),
    new PrescriptionItem(name: 'Tips', category: Category.tip, tips: [
      'Drink 2 Cups of Water Each Morning.',
      'Have A lots Of Red Fruits And Greens.',
    ])
  ];
}

class MyFrequency {
  String unit;
  int quantity;
  String description;

  MyFrequency({this.unit, this.quantity, this.description});
}

class Period {
  int year;
  int month;
  int day;

  Period({this.year, this.month, this.day});
}

class Category {
  static const bottle_of_pills = const Category._("Bottle of Pills");
  static const blood_analysis = const Category._("Blood Analysis");
  static const syringe = const Category._("Syringe");
  static const tip = const Category._("Tip");

  static get categories => [bottle_of_pills, blood_analysis, syringe, tip];

  final String category;

  const Category._(this.category);
}
