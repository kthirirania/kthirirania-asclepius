import 'package:asclepius/models/perscription.dart';
import 'package:asclepius/widgets/load_image.dart';
import 'package:asclepius/widgets/prescription_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kf_drawer/kf_drawer.dart';

class PrescriptionScreen extends KFDrawerContent {
  PrescriptionScreen({
    Key key,
  });

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<PrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[50],
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 6, top: 8.0),
                child: getToolBar(),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16.0, left: 8.0, top: 16.0),
                        child: getPrescriptionHeader(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16.0, left: 16, top: 24, bottom: 24),
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: Prescription.prescriptions.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: PrescriptionWidget(
                                    prescription:
                                        Prescription.prescriptions[index]),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getPrescriptionHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 8,
            ),
            SvgPicture.asset('assets/images/report.svg', width: 28, height: 28),
            SizedBox(
              width: 8,
            ),
            Text(
              'My Prescriptions',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Icon(
          Icons.menu,
          size: 20,
        )
      ],
    );
  }

  Widget getToolBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/images/menu.svg',
              color: Colors.black, width: 20, height: 20),
          onPressed: widget.onMenuPressed,
        ),
        Row(
          children: <Widget>[
            SvgPicture.asset('assets/images/search.svg',
                color: Colors.black, width: 18, height: 18),
            SizedBox(
              width: 8.0,
            ),
            SvgPicture.asset('assets/images/bell.svg',
                color: Colors.black, width: 20, height: 20),
            SizedBox(
              width: 8.0,
            ),
            LoadImage(
              "https://drive.google.com/uc?export=view&id=1bcQaCdWNUsXF2he704ZfUrofxw6KV9KH",
              30,
              30,
              0,
              30,
              30,
            ),
          ],
        )
      ],
    );
  }
}
