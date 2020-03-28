import 'package:asclepius/models/perscription.dart';
import 'package:flutter/material.dart';

import '../screens/prescription_details_screen.dart';

class PrescriptionWidget extends StatefulWidget {
  Prescription prescription;

  PrescriptionWidget({Key key, @required this.prescription}) : super(key: key);

  @override
  _PrescriptionWidgetState createState() => _PrescriptionWidgetState();
}

class _PrescriptionWidgetState extends State<PrescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PrescriptionDetailsScreen(widget.prescription))),
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
                      widget.prescription.place,
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
                      widget.prescription.date,
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
                      widget.prescription.doctor.name,
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
                      widget.prescription.prescriptionItems.length.toString(),
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
}
