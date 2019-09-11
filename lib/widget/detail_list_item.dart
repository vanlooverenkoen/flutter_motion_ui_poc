import 'package:flutter/material.dart';
import 'package:flutter_transitions/model/car.dart';
import 'package:flutter_transitions/util/colors.dart';
import 'package:flutter_transitions/util/hero.dart';
import 'package:flutter_transitions/widget/fade_in.dart';
import 'package:flutter_transitions/widget/fade_in_ui.dart';
import 'package:flutter_transitions/widget/fade_out.dart';

class DetailListItem extends StatelessWidget {
  final Car car;
  final int index;
  final bool fadeIn;

  const DetailListItem({
    @required this.car,
    @required this.index,
    @required this.fadeIn,
  });

  @override
  Widget build(BuildContext context) {
    print(fadeIn);
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
                        height: 208,
                      ),
                    ),
                    Positioned(
                      top: 76,
                      right: 0,
                      left: 0,
                      child: Column(
                        children: [
                          Hero(
                            tag: ThemeHero.carLogo(index.toString()),
                            child: Image.asset(
                              car.manufacturerLogoUrl,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          if (fadeIn)
                            FadeIn(
                              delay: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                    ),
                                    child: Center(
                                      child: Text('More info'),
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 32,
                  child: Center(
                    child: FadeOut(
                      child: Hero(
                        child: Material(
                            type: MaterialType.transparency,
                            child: Text(car.model)),
                        tag: ThemeHero.model(index.toString()),
                      ),
                    ),
                  ),
                ),
                FadeInUI(
                  delay: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(car.quote),
                      Text(
                        car.description,
                        style: TextStyle(
                          color: ThemeColors.textColor,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
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
