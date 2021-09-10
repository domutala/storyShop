import 'dart:async';

import 'package:story_shop/components/ArticleOne.dart';
import 'package:story_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VGallery extends StatefulWidget {
  VGallery();

  @override
  _VGalleryState createState() => _VGalleryState();
}

class _VGalleryState extends State<VGallery> {
  _VGalleryState();

  List<Widget> _articles = [];
  int _cuurentArt = 0;

  bool _verticalDragSart = false;
  double _verticalDragSartTo = 0;

  bool _horizontalDragSart = false;
  double _horizontalDragSartTo = 0;
  double _horizontalDragDistance = 0;
  TextEditingController _bottomWidgetPosition =
      TextEditingController(text: '-200');
  double _bottomWidgetPosition0 = -200;

  double duration = 10;
  int _progess = 0;
  Timer? _timer;
  bool _tapDown = false;

  Size get mediaSize => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    setState(() {
      _articles.addAll([
        ArticleOne(id: 1, bottomWidgetPosition: _bottomWidgetPosition),
        ArticleOne(id: 2, bottomWidgetPosition: _bottomWidgetPosition),
        ArticleOne(id: 3, bottomWidgetPosition: _bottomWidgetPosition),
        ArticleOne(id: 4, bottomWidgetPosition: _bottomWidgetPosition),
      ]);
    });

    setProgess();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: xPrimary,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: xPrimary,
      ),
    );

    return Scaffold(
      body: bodyBuilder(),
    );
  }

  Widget bodyBuilder() {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTapDown: (tap) => setState(() => _tapDown = true),
          onTapUp: (tap) => setState(() => _tapDown = false),
          onTapCancel: () => setState(() => _tapDown = false),
          onVerticalDragStart: onVerticalDragStart,
          onVerticalDragUpdate: onVerticalDragUpdate,
          onVerticalDragEnd: (darg) => onVerticalDragEnd(),
          onVerticalDragCancel: () => onVerticalDragEnd(),

          // hDrag
          onHorizontalDragStart: onHorizontalDragStart,
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          onHorizontalDragEnd: (darg) => onHorizontalDragEnd(),
          onHorizontalDragCancel: () => onHorizontalDragEnd(),

          // ---
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(),
              for (var i = 0; i < _articles.length; i++)
                Positioned(
                  width: mediaSize.width,
                  left: ((i - _cuurentArt) * mediaSize.width) +
                      -_horizontalDragDistance,
                  top: 0,
                  bottom: 0,
                  child: _articles[i],
                ),
              Positioned(
                top: 70,
                left: 0,
                right: 0,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 300,
                      height: 6,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).primaryColorDark.withOpacity(.5),
                      ),
                      child: Container(
                        width: (300 / 100) * _progess,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  onHorizontalDragStart(drag) {
    var dx = drag.globalPosition.dx;

    if (_bottomWidgetPosition0 <= -200) {
      setState(() => _horizontalDragSart = true);
      setState(() => _horizontalDragDistance = 0);
      setState(() => _horizontalDragSartTo = dx);
    }
  }

  onHorizontalDragUpdate(drag) {
    if (_horizontalDragSart) {
      var distance = _horizontalDragSartTo - drag.globalPosition.dx;
      setState(() => _horizontalDragDistance = distance);
    }
  }

  onHorizontalDragEnd() {
    setState(() => _horizontalDragSart = false);

    if (_horizontalDragDistance.abs() >= mediaSize.width / 3) {
      if (_horizontalDragDistance < 0) prev();
      if (_horizontalDragDistance > 0) next();

      setState(() => _horizontalDragDistance = 0);
    } else
      progessiveRemakeHorizontalDrag();
  }

  onVerticalDragStart(drag) {
    var dy = drag.globalPosition.dy;

    if (mediaSize.height - 200 <= dy) {
      setState(() => _verticalDragSart = true);
      setState(() => _verticalDragSartTo = dy);
    } else
      setState(() => _verticalDragSart = false);
  }

  onVerticalDragUpdate(drag) {
    if (_verticalDragSart) {
      var distance = _verticalDragSartTo - drag.globalPosition.dy;
      setState(() => _bottomWidgetPosition0 = -200 + distance);

      if (_bottomWidgetPosition0 > 0)
        setState(() => _bottomWidgetPosition0 = 0);
      else if (_bottomWidgetPosition0 < -200)
        setState(() => _bottomWidgetPosition0 = -200);

      setState(() => _bottomWidgetPosition.text = '$_bottomWidgetPosition0');
    }
  }

  onVerticalDragEnd() {
    setState(() => _verticalDragSart = false);

    if (_bottomWidgetPosition0 < -150) {
      setState(() => _bottomWidgetPosition0 = -200);
    } else {
      setState(() => _bottomWidgetPosition0 = 0);
    }

    setState(() => _bottomWidgetPosition.text = '$_bottomWidgetPosition0');
  }

  progessiveRemakeHorizontalDrag() {
    var sens = _horizontalDragDistance.isNegative ? 1 : -1;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() => _horizontalDragDistance += (sens * 10));

      if (_horizontalDragDistance < 0) {
        setState(() => _horizontalDragDistance = 0);
        timer.cancel();
      }
    });
  }

  next() {
    if (_cuurentArt + 1 < _articles.length) {
      _timer!.cancel();
      setState(() => _progess = 0);
      setState(() => _cuurentArt++);
      setProgess();
    }
    // else {
    //   Navigator.of(context).pop();
    // }
  }

  prev() {
    if (_cuurentArt > 0) {
      _timer!.cancel();
      setState(() => _progess = 0);
      setState(() => _cuurentArt--);
      setProgess();
    }
  }

  setProgess() {
    var ms = duration * 1000;
    var tick = 0;

    _timer = Timer.periodic(Duration(microseconds: 1), (timer) {
      if (_bottomWidgetPosition0 <= -200 && !_tapDown) {
        tick++;
        var t = ((tick / 100) % ms).toInt();
        setState(() => _progess = t);

        if (tick >= ms) {
          next();
        }
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
