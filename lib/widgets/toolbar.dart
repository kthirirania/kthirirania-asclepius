import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'load_image.dart';

class Toolbar extends KFDrawerContent {
  Toolbar({
    Key key,
  });

  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  @override
  Widget build(BuildContext context) {
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
