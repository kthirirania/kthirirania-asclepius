class Tip {
  String category;
  String text;
  String title;
  List<String> bulletPoints;
  bool isVisible;

  Tip(this.title,
      {this.category, this.text, this.bulletPoints, this.isVisible});
}
