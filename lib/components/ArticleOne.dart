import 'package:story_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleOne extends StatefulWidget {
  final int id;
  final TextEditingController bottomWidgetPosition;

  ArticleOne({
    required this.id,
    required this.bottomWidgetPosition,
  });

  @override
  _ScreenInitState createState() => _ScreenInitState(
        id: this.id,
        bottomWidgetPosition: this.bottomWidgetPosition,
      );
}

class _ScreenInitState extends State<ArticleOne> {
  final int id;
  final TextEditingController bottomWidgetPosition;

  _ScreenInitState({
    required this.id,
    required this.bottomWidgetPosition,
  });

  double _bp = -200;

  @override
  void initState() {
    super.initState();

    bottomWidgetPosition.addListener(() {
      setState(() {
        _bp = double.parse(bottomWidgetPosition.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyBuilder(),
    );
  }

  Widget bodyBuilder() {
    return Listener(
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: xLight,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/$id.png'),
                  ),
                ),
                Positioned(
                  bottom: _bp,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: infosBuilder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infosBuilder() {
    return Container(
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: xPrimary,
              height: 180,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'XOF 15 500',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Robe Wax',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      for (var i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            size: 12,
                            color:
                                i < 4 ? Colors.yellow : xDark.withOpacity(.5),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 50,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      color: xDark,
                      borderRadius: BorderRadius.circular(
                        42,
                      )),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/shopping-cart.svg',
                      width: 24,
                      color: xLight,
                    ),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -7,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow,
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 40,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.yellow,
              ),
              child: Center(
                child: Text(
                  '+ Ajouter au panier',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
