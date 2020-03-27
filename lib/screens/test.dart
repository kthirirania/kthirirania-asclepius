import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          generateBlurredImage(),
          rectShapeContainer(context),
        ],
      ),
    );
  }

  Widget generateBlurredImage() {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new BackdropFilter(
        filter: new ui.ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
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

        /*
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: new Offset(5.0, 5.0),
          ),
        ],
         */
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[],
        ),
      ),
    );
  }
}
