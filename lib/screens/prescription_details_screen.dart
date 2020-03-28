import 'package:asclepius/models/perscription.dart';
import 'package:asclepius/widgets/prescription_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrescriptionDetailsScreen extends StatefulWidget {
  Prescription prescription;

  PrescriptionDetailsScreen(this.prescription);

  @override
  _PrescriptionDetailsScreenState createState() =>
      _PrescriptionDetailsScreenState();
}

class _PrescriptionDetailsScreenState extends State<PrescriptionDetailsScreen> {
  bool isPortrait = true;

  @override
  Widget build(BuildContext context) {
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        right: false,
        left: false,
        child: Stack(
          children: <Widget>[
            getHeader(),
            Container(
              margin: EdgeInsets.only(
                top: isPortrait ? 200 : 168,
              ),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 12),
                      child: Text(
                        'Prescription\'s Items',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 4),
                      child: Text(
                        widget.prescription.date,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 22),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent[100],
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, right: 10, left: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              widget.prescription.prescriptionItems.length > 1
                                  ? Text(
                                      widget.prescription.prescriptionItems
                                              .length
                                              .toString() +
                                          ' Items',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : Text(
                                      '1 Item',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    getListPresItems(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getHeader() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff0e98cf),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ]),
      child: Padding(
        padding: isPortrait
            ? EdgeInsets.only(right: 16.0, left: 16, top: 64, bottom: 30)
            : EdgeInsets.only(right: 48.0, left: 32, top: 32, bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/images/back.svg',
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Prescription Details',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/doctor_person.svg',
                      height: 46,
                      width: 46,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                  ),
                                  text: widget.prescription.doctor.prefix + ' ',
                                ),
                                TextSpan(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  text: widget.prescription.doctor.name,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/images/stethoscope.svg',
                              height: 20,
                              width: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            widget.prescription.isFilledByDoctor != null &&
                                    widget.prescription.isFilledByDoctor
                                ? Flexible(
                                    child: Text(
                                      'This prescription was added by your '
                                      'doctor.',
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                : Flexible(
                                    child: Text(
                                      'This prescription is added you, '
                                      'recommand your doctor and earn 50% reduction.',
                                      softWrap: true,
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getListPresItems(BuildContext context) {
    Widget gridLayout = GridView.count(
      crossAxisCount: 2,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline,
          ),
        );
      }),
    );

    Widget listLayout = Padding(
      padding: isPortrait
          ? EdgeInsets.only(right: 16, left: 24)
          : EdgeInsets.only(right: 48, left: 32),
      child: ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.prescription.prescriptionItems.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: PrescriptionItemWidget(
                prescriptionItem: widget.prescription.prescriptionItems[index],
              ),
            );
          }),
    );

    return listLayout;
  }
}
