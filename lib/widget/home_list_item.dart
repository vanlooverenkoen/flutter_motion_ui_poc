import 'package:flutter/material.dart';
import 'package:flutter_transitions/model/car.dart';
import 'package:flutter_transitions/util/hero.dart';

class HomeListItem extends StatelessWidget {
  final Car car;
  final int index;
  final VoidCallback onClick;

  const HomeListItem({
    @required this.car,
    @required this.index,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
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
                        width: 150,
                        padding: const EdgeInsets.all(32),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      child: Center(
                        child: Hero(
                          tag: ThemeHero.carLogo(index.toString()),
                          child: Image.asset(
                            car.manufacturerLogoUrl,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(height: 8),
                Text(car.model)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
