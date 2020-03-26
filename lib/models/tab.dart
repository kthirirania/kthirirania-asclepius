import 'dart:ui';

class MyTab {
  int index;
  String name;
  String inactiveSvg;
  String activeSvg;
  Color inactiveColor;
  Color activeColor;
  Color textColor;

  MyTab(this.index, this.name, this.inactiveSvg, this.activeSvg,
      {this.inactiveColor, this.activeColor, this.textColor});
}
