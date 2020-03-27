import 'package:asclepius/models/perscription.dart';
import 'package:flutter/material.dart';

class PrescriptionDetailsScreen extends StatefulWidget {
  Prescription prescription;

  PrescriptionDetailsScreen(this.prescription);

  @override
  _PrescriptionDetailsScreenState createState() =>
      _PrescriptionDetailsScreenState();
}

class _PrescriptionDetailsScreenState extends State<PrescriptionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[50],
          child: Stack(
            children: <Widget>[
              Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, left: 16, top: 8.0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.arrow_back),
                          )),
                      Text('Prescription Details'),
                    ],
                  )),
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
                            right: 16.0, left: 16, top: 24, bottom: 24),
                        child: getItem(widget.prescription),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 16,
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 4, left: 16, right: 16),
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
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 4, left: 16, right: 16),
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
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 4, left: 16, right: 16),
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
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 4, left: 16, right: 16),
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
            padding:
                const EdgeInsets.only(top: 4.0, bottom: 4, right: 16, left: 16),
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
    );
  }
}
