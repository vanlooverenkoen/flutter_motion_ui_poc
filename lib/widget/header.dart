import 'package:flutter/material.dart';
import 'package:flutter_transitions/util/colors.dart';

class Header extends StatelessWidget {
  final bool showCloseButton;

  const Header({@required this.showCloseButton});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'VROOM',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  if (showCloseButton)
                    Positioned(
                      right: 16,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                  color: ThemeColors.searchColor,
                ),
                child: Center(
                  child: Text(
                    'Search your dream car',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
