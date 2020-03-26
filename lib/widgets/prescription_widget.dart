import 'package:asclepius/models/prescription_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class PrescriptionWidget extends StatefulWidget {
  @override
  _PrescriptionWidgetState createState() => _PrescriptionWidgetState();
}

class _PrescriptionWidgetState extends State<PrescriptionWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  List<PrescriptionItem> prescriptions = [
    new PrescriptionItem(
        'Adderall',
        'pills',
        2,
        new MyDate(0, 2, 0),
        new MyFrequency('Each Morning', 1, '1x Each Morning'),
        false,
        false,
        'pills'),
    new PrescriptionItem(
        'Vitamine D Blood Test',
        'analysis',
        0,
        new MyDate(0, 0, 0),
        new MyFrequency(
            'Vitamine D Blood Test', 1, 'Take the test while fasting'),
        false,
        false,
        'test-tube',
        place: 'Zex Medical Center of Analysis'),
    new PrescriptionItem(
        'Adderall',
        'syring',
        5,
        new MyDate(0, 0, 5),
        new MyFrequency('After Launch', 1, '5x After Launch Every Day'),
        false,
        false,
        'syringe'),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  //height: 210 * prescriptions.length.toDouble(),

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Your Prescription',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                    text: 'Written By , ',
                  ),
                  TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                    text: 'Dr. Sondes Kthiri',
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 6,
            ),
            SvgPicture.asset(
              'assets/images/stethoscope.svg',
              height: 20,
              width: 20,
            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                    text: 'On ',
                  ),
                  TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    text: 'Tuesday 10, March 2020',
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: prescriptions.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: getItem(prescriptions[index]),
              );
            }),
      ],
    );
  }

  Widget getItem(PrescriptionItem prescriptionItem) {
    return Container(
      height: 170,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      prescriptionItem.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    if (prescriptionItem.category == 'pills' ||
                        prescriptionItem.category == 'syring')
                      Text(
                        'Quantity: ' +
                            prescriptionItem.quantity.toString() +
                            ' Items',
                        style: TextStyle(fontSize: 14),
                      ),
                    if (prescriptionItem.category == 'analysis')
                      Text(
                        'At: ' + prescriptionItem.place,
                        style: TextStyle(fontSize: 14),
                      ),
                    if (prescriptionItem.category == 'pills' ||
                        prescriptionItem.category == 'syring')
                      Text(
                        'Period: ' +
                            prescriptionItem.frequency.quantity.toString() +
                            ' Months',
                        style: TextStyle(fontSize: 14),
                      ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          prescriptionItem.frequency.description,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Stack(
                              overflow: Overflow.clip,
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      //color: Colors.redAccent,
                                      shape: BoxShape.circle),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        prescriptionItem.isBought =
                                            !prescriptionItem.isBought;

                                        if (prescriptionItem.isBought) {
                                          _controller.animateTo(0.7);
                                        } else {
                                          _controller.reset();
                                        }
                                      });
                                    },
                                    child: Lottie.asset(
                                      'assets/lotties/buy_1.json',
                                      controller: _controller,
                                      onLoaded: (composition) {
                                        _controller.duration =
                                            composition.duration;
                                        _controller.reset();
                                      },
                                      height: 75,
                                      width: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -20,
              right: -10,
              child: SvgPicture.asset(
                'assets/images/' + prescriptionItem.svg + '.svg',
                height: 80,
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
