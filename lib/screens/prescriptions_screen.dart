import 'package:asclepius/models/perscription.dart';
import 'package:asclepius/widgets/load_image.dart';
import 'package:asclepius/widgets/prescription_widget.dart';
import 'package:flutter/cupertino.dart';
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
  bool animating = false;

  @override
  void initState() {
    super.initState();
    /*
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
    */
  }

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
                margin: EdgeInsets.only(top: 50, bottom: 0),
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
                            right: 16.0, left: 16, top: 24, bottom: 44),
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
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      _showDialog();
                    },
                    child: SvgPicture.asset(
                      'assets/images/add.svg',
                      height: 52,
                      width: 52,
                    ),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog() async {
    /*
    if (Platform.isIOS)
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Add Your New Prescription'),
            content: Text(
                'Your current location will be displayed on the map and used for directions, nearby search results, and estimated travel times.'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('Don\'t Allow'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text('Allow'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    */

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          title: Center(
            child: Text(
              "Add Your New Perspection",
              style: TextStyle(fontSize: 16),
            ),
          ),
          content: Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 8, left: 8, right: 8),
            child: AnimatedContainer(
              height: animating ? 600.0 : 120.0,
              width: animating ? 300.0 : 260.0,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Container(
                height: animating ? 600.0 : 120.0,
                width: animating ? 300.0 : 260.0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300],
                                    spreadRadius: 2.0,
                                    blurRadius: 1.0,
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SvgPicture.asset(
                                'assets/images/qr-code.svg',
                                height: 68,
                                width: 68,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          animating = true;
                        }),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300],
                                    spreadRadius: 2.0,
                                    blurRadius: 1.0,
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SvgPicture.asset(
                                'assets/images/add.svg',
                                height: 68,
                                width: 68,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          /*
            actions: <Widget>[
              FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            */
        );
      },
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
