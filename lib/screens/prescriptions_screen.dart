import 'package:asclepius/models/perscription.dart';
import 'package:asclepius/widgets/load_image.dart';
import 'package:asclepius/widgets/prescription_details_screen.dart';
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
                                child:
                                    getItem(Prescription.prescriptions[index]),
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

  Widget getItem(Prescription prescription) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PrescriptionDetailsScreen(prescription))),
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 4, left: 16, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.place,
                      size: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Container(
                    width: 60,
                    child: Text('Place: '),
                  ),
                  Flexible(
                    child: Text(
                      prescription.place,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 4, left: 16, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.date_range,
                      size: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Container(
                    width: 60,
                    child: Text('Date: '),
                  ),
                  Flexible(
                    child: Text(
                      prescription.date,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 4, left: 16, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.account_circle,
                      size: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Container(
                    width: 60,
                    child: Text('Doctor: '),
                  ),
                  Flexible(
                    child: Text(
                      prescription.doctor.name,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 4, left: 16, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.library_books,
                      size: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Container(
                    width: 60,
                    child: Text('Items: '),
                  ),
                  Flexible(
                    child: Text(
                      prescription.prescriptionItems.length.toString(),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, bottom: 4, right: 16, left: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: Colors.redAccent[200],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.bookmark_border,
                          size: 20,
                          color: Colors.redAccent[200],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.attach_file,
                          size: 20,
                          color: Colors.redAccent[200],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.more_vert,
                          size: 20,
                          color: Colors.redAccent[200],
                        ),
                      ),
                      Icon(
                        Icons.share,
                        size: 20,
                        color: Colors.redAccent[200],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
