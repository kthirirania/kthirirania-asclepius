import 'dart:ui' as ui;

import 'package:asclepius/screens/home_screen.dart';
import 'package:asclepius/screens/prescriptions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kf_drawer/kf_drawer.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({
    Key key,
  });

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: HomeScreen(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Home', style: TextStyle(color: Colors.white)),
          icon: SvgPicture.asset('assets/images/hospital_2.svg',
              width: 22, height: 22),
          page: HomeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Presriptions',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset('assets/images/report.svg',
              width: 22, height: 22),
          page: PrescriptionScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Appointments',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset('assets/images/calendar.svg',
              width: 22, height: 22),
          page: HomeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Reminders',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset('assets/images/vitamins.svg',
              width: 22, height: 22),
          page: HomeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Doctors',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset('assets/images/doctor.svg',
              width: 22, height: 22),
          page: HomeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Drug Stores',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset('assets/images/pharmacies.svg',
              width: 22, height: 22),
          page: HomeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Labs',
            style: TextStyle(color: Colors.white),
          ),
          icon:
              SvgPicture.asset('assets/images/labs.svg', width: 22, height: 22),
          page: HomeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: HomeScreen(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          generateBlurredImage(),
          rectShapeContainer(context),
        ],
      ),
    );
  }

  Widget generateBlurredImage() {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new BackdropFilter(
        filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  Widget rectShapeContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.black.withOpacity(0.7),
      ),
      child: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/tip.svg',
                  width: 50,
                  height: 50,
                  alignment: Alignment.centerLeft,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Asclepius',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'SIGN OUT',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return HomeScreen();
              },
            ));
          },
        ),
      ),
    );
  }
}
