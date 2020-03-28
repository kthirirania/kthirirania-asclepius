import 'package:asclepius/models/prescription_item.dart';
import 'package:asclepius/widgets/prescription_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class PrescriptionTabWidget extends StatefulWidget {
  @override
  _PrescriptionTabWidgetState createState() => _PrescriptionTabWidgetState();
}

class _PrescriptionTabWidgetState extends State<PrescriptionTabWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  List<PrescriptionItem> prescriptions = PrescriptionItem.getPrescriptions;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getPrescriptionHeader(),
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: prescriptions.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: PrescriptionItemWidget(
                  prescriptionItem: prescriptions[index],
                ),
              );
            }),
      ],
    );
  }

  Widget getPrescriptionHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Recent Prescription',
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
      ],
    );
  }

  Widget getButton(PrescriptionItem prescriptionItem) {
    return Align(
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
                    prescriptionItem.isBought = !prescriptionItem.isBought;

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
                    _controller.duration = composition.duration;
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
    );
  }
}
