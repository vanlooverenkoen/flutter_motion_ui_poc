import 'package:flutter/material.dart';
import 'package:flutter_transitions/model/car.dart';
import 'package:flutter_transitions/util/hero.dart';

class DetailListItem extends StatelessWidget {
  final Car car;
  final int index;

  const DetailListItem({
    @required this.car,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 84),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Hero(
                      transitionOnUserGestures: true,
                      tag: ThemeHero.card(index.toString()),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Colors.white,
                        ),
                        height: 150,
                      ),
                    ),
                    Positioned(
                      top: 85,
                      right: 0,
                      left: 0,
                      child: Hero(
                        tag: ThemeHero.carLogo(index.toString()),
                        child: Image.asset(
                          car.manufacturerLogoUrl,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(height: 32),
                Text(car.model),
              ],
            ),
          ),
          Positioned(
            right: 32,
            left: 32,
            child: Hero(
              transitionOnUserGestures: true,
              tag: ThemeHero.car(index.toString()),
              child: Image.asset(car.imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
