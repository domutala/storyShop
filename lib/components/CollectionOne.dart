import 'package:story_shop/utils/colors.dart';
import 'package:flutter/material.dart';

class CollectionOne extends StatefulWidget {
  final int id;

  CollectionOne({required this.id});

  @override
  _CollectionOneState createState() => _CollectionOneState(id: this.id);
}

class _CollectionOneState extends State<CollectionOne> {
  final int id;

  _CollectionOneState({required this.id});

  List<Map<String, String>> collections = [
    {
      "name": 'Vêtement',
      "image": 'shirt_1.png',
      "infos": '',
    },
    {
      "name": 'Chaussures',
      "image": 'shoe.png',
      "infos": '+16',
    },
    {
      "name": 'Sacs',
      "image": 'backpack.png',
      "infos": 'Nouveauté',
    },
    {
      "name": 'Montres',
      "image": 'make-up.png',
      "infos": '',
    },
    {
      "name": 'Bébé',
      "image": 'stroller.png',
      "infos": 'nouveauté',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('gallery');
      },
      child: Container(
        width: 170,
        height: 260,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: xLight,
          border: Border.all(
            color: Theme.of(context).primaryColorDark.withOpacity(.1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Image(
                    image:
                        AssetImage('assets/images/${collections[id]['image']}'),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '${collections[id]['name']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '${collections[id]['infos']}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
