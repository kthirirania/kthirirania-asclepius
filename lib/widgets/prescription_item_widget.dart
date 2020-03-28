import 'package:asclepius/models/prescription_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrescriptionItemWidget extends StatefulWidget {
  PrescriptionItem prescriptionItem;

  PrescriptionItemWidget({Key key, @required this.prescriptionItem})
      : super(key: key);

  @override
  _PrescriptionItemWidgetState createState() => _PrescriptionItemWidgetState();
}

class _PrescriptionItemWidgetState extends State<PrescriptionItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 10),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 14.0, bottom: 14, right: 40, left: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (widget.prescriptionItem.name != null &&
                            widget.prescriptionItem.name.trim() != '')
                          Text(
                            widget.prescriptionItem.name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        if (widget.prescriptionItem.place != null &&
                            widget.prescriptionItem.place.trim() != '')
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      text: 'At: '),
                                  TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      text: widget.prescriptionItem.place),
                                ],
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 16,
                        ),
                        if (widget.prescriptionItem.period != null)
                          getPeriod(widget.prescriptionItem.period),
                        if (widget.prescriptionItem.quantity != null &&
                            widget.prescriptionItem.quantity > 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      text: 'Quantity: '),
                                  customTextSpan(
                                      isNumber: true,
                                      number: widget.prescriptionItem.quantity),
                                  if (widget.prescriptionItem.unit != null)
                                    customTextSpan(
                                        isDynamicString: true,
                                        number:
                                            widget.prescriptionItem.quantity,
                                        text: widget.prescriptionItem.unit),
                                ],
                              ),
                            ),
                          ),
                        if (widget.prescriptionItem.tips != null)
                          for (var i = 0;
                              i < widget.prescriptionItem.tips.length;
                              i++)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.bubble_chart,
                                      size: 14,
                                      color: Colors.green[400],
                                    ),
                                  ),
                                  Text(widget.prescriptionItem.tips[i]),
                                ],
                              ),
                            )
                      ],
                    ),
                  ),
                  if (widget.prescriptionItem.category != Category.tip)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10, right: 12, left: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  if (widget.prescriptionItem.frequency !=
                                          null &&
                                      widget.prescriptionItem.frequency
                                              .description !=
                                          null)
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.timer,
                                          size: 20,
                                          color: Colors.redAccent,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          widget.prescriptionItem.frequency
                                              .description,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  if (widget.prescriptionItem.note != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.lightbulb_outline,
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            widget.prescriptionItem.note,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              Icon(
                                Icons.more_vert,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            getImage(widget.prescriptionItem.category),
          ],
        ),
      ),
    );
  }

  Widget getPeriod(Period period) {
    int keepTrack = 0;
    List<TextSpan> textSpans = [];

    if (period.year != null && period.year > 0) {
      textSpans.addAll([
        customTextSpan(isNumber: true, number: period.year),
        customTextSpan(
            isDynamicString: true, number: period.year, text: 'Year'),
      ]);

      keepTrack++;
    }

    if (period.month != null && period.month > 0) {
      if (keepTrack == 1)
        textSpans.add(TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black54,
              fontSize: 12,
            ),
            text: ' , '));

      textSpans.addAll([
        customTextSpan(isNumber: true, number: period.month),
        customTextSpan(
            isDynamicString: true, number: period.month, text: 'Month'),
      ]);
    }

    if (period.day != null && period.day > 0) {
      if (keepTrack == 1)
        textSpans.add(TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black54,
              fontSize: 12,
            ),
            text: ' , and '));

      textSpans.addAll([
        customTextSpan(isNumber: true, number: period.day),
        customTextSpan(isDynamicString: true, number: period.day, text: 'Day'),
      ]);
    }

    RichText richText = RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 14,
              ),
              text: 'Period: '),
          for (var i = 0; i < textSpans.length; i++) textSpans[i],
        ],
      ),
    );

    return richText;
  }

  Widget getImage(Category category) {
    switch (category) {
      case Category.bottle_of_pills:
        return Positioned(
          top: -20,
          right: -10,
          child: SvgPicture.asset(
            'assets/images/pills.svg',
            height: 80,
            width: 80,
          ),
        );
        break;
      case Category.blood_analysis:
        return Positioned(
          top: -20,
          right: -10,
          child: SvgPicture.asset(
            'assets/images/test-tube.svg',
            height: 80,
            width: 80,
          ),
        );
        break;
      case Category.syringe:
        return Positioned(
          top: -20,
          right: -10,
          child: SvgPicture.asset(
            'assets/images/syringe.svg',
            height: 80,
            width: 80,
          ),
        );
        break;
      case Category.tip:
        return Positioned(
          top: -20,
          right: -10,
          child: SvgPicture.asset(
            'assets/images/tip.svg',
            height: 65,
            width: 65,
          ),
        );
        break;
      default:
        return Positioned(
          top: -20,
          right: -10,
          child: SvgPicture.asset(
            'assets/images/pills.svg',
            height: 80,
            width: 80,
          ),
        );
        break;
    }
  }

  TextSpan customTextSpan(
      {String text,
      bool isNumber,
      bool isSmall,
      bool isDynamicString,
      FontWeight fontWeight,
      int number,
      Color color,
      double size}) {
    if (isNumber != null)
      return TextSpan(
          style: TextStyle(
            fontWeight: fontWeight != null ? fontWeight : FontWeight.w500,
            color: color != null ? color : Colors.black,
            fontSize: size != null ? size : 14,
          ),
          text: number != 1 ? number.toString() : '1');

    if (isDynamicString != null)
      return TextSpan(
          style: TextStyle(
            fontWeight: fontWeight != null ? fontWeight : FontWeight.w400,
            color: color != null ? color : Colors.black,
            fontSize: size != null ? size : 14,
          ),
          text: number != 1 ? ' ' + text + 's' : ' ' + text);

    if (isSmall != null)
      return TextSpan(
          style: TextStyle(
            fontWeight: fontWeight != null ? fontWeight : FontWeight.w300,
            color: color != null ? color : Colors.black54,
            fontSize: size != null ? size : 12,
          ),
          text: text != null ? text : '');

    return TextSpan(
        style: TextStyle(
          fontWeight: fontWeight,
          color: color != null ? color : Colors.black,
          fontSize: size,
        ),
        text: text != null ? text : '');
  }
}
