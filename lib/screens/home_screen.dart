import 'package:asclepius/models/tab.dart';
import 'package:asclepius/models/tip.dart';
import 'package:asclepius/widgets/load_image.dart';
import 'package:asclepius/widgets/prescription_widget.dart';
import 'package:asclepius/widgets/under_construction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends KFDrawerContent {
  HomeScreen({
    Key key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int currentIndex = 0;
  bool isTipVisible = false;
  bool isLiked = false;

  AnimationController _controller;

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

  List<MyTab> tabs = [
    new MyTab(
        0, 'Prescription', 'prescription_outlined', 'prescription_colored',
        textColor: Colors.red[400]),
    new MyTab(1, 'Meds', 'pills_outlined', 'pills_colored',
        textColor: Colors.red[400]),
    new MyTab(2, 'Analysis', 'dna_outline', 'dna_colored',
        textColor: Colors.red[400]),
    new MyTab(3, 'Cardio', 'heart_outlined', 'heart',
        textColor: Colors.red[400]),
    new MyTab(5, 'Scans', 'body-scan_outlined', 'body-scan_colored',
        textColor: Colors.red[400])
  ];

  Tip tip = new Tip('Drink Water At The Right Time',
      bulletPoints: [
        '2 Cups after waking up',
        '1 Cup 30 mn before a meal',
        '1 Cup before taking a bath.',
        '1 Cup before going to bed.'
      ],
      isVisible: true);

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
                    const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
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
                            top: 16.0, right: 16, left: 16, bottom: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/cloudy.svg',
                                  height: 52,
                                  width: 52,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                              fontSize: 22,
                                            ),
                                            text: 'Morning, ',
                                          ),
                                          TextSpan(
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 22,
                                            ),
                                            text: '',
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Wednesday, 25 March 2020',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if (!tip.isVisible)
                              InkWell(
                                onTap: () => setState(() {
                                  tip.isVisible = true;
                                }),
                                child: SvgPicture.asset(
                                  'assets/images/care.svg',
                                  height: 36,
                                  width: 36,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (tip.isVisible)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: getTip(tip),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16.0, left: 16.0, top: 16.0, bottom: 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            for (var i = 0; i < tabs.length; i++)
                              if (tabs[i].index == currentIndex)
                                getActiveButton(tabs[i])
                              else
                                getInactiveButton(tabs[i])
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: getCurrentTab(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCurrentTab() {
    switch (currentIndex) {
      case 0:
        return PrescriptionWidget();
        break;
      default:
        return UnderConstruction();
    }
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

  Widget getTip(Tip tip) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/care.svg',
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Tip Of The Day',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => setState(() {
                    tip.isVisible = false;
                  }),
                  child: Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              tip.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/water.svg',
                    height: 40,
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 16.0,
                      ),
                      for (var i = 0; i < tip.bulletPoints.length; i++)
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, bottom: 10.0),
                          child: Text(
                            tip.bulletPoints[i],
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;

                    if (isLiked) {
                      _controller.animateTo(2.0);
                    } else {
                      _controller.reset();
                    }
                  });
                },
                child: Lottie.asset(
                  'assets/lotties/like_1.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller.duration = composition.duration;
                    _controller.stop();
                  },
                  //animate: isLiked,
                  repeat: false,
                  height: 36,
                  width: 36,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getActiveButton(MyTab tab) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              right: 12.0, left: 12.0, top: 8.0, bottom: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/' + tab.activeSvg + '.svg',
                color: tab.activeColor,
                height: 24,
                width: 24,
              ),
              SizedBox(
                width: 6.0,
              ),
              Text(tab.name, style: TextStyle(color: tab.textColor))
            ],
          ),
        ),
      ),
    );
  }

  Widget getInactiveButton(MyTab tab) {
    return InkWell(
      onTap: () => setState(() {
        currentIndex = tab.index;
      }),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[400]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              right: 10.0, left: 10.0, top: 8.0, bottom: 8.0),
          child: SvgPicture.asset(
            'assets/images/' + tab.inactiveSvg + '.svg',
            color: tab.inactiveColor,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];

  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}
