import 'package:flutter/material.dart';
import 'package:flutter_transitions/repository/car_repo.dart';
import 'package:flutter_transitions/util/assets.dart';
import 'package:flutter_transitions/util/colors.dart';
import 'package:flutter_transitions/util/hero.dart';
import 'package:flutter_transitions/widget/detail_list_item.dart';
import 'package:flutter_transitions/widget/header.dart';

class DetailScreen extends StatefulWidget {
  final int currentPage;

  const DetailScreen({@required this.currentPage});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _carRepo = CarRepo();
  PageController controller;
  var _currentpage = 0;

  @override
  void initState() {
    super.initState();
    _currentpage = widget.currentPage;
    controller = new PageController(
      initialPage: _currentpage,
      keepPage: true,
      viewportFraction: 0.95,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      body: GestureDetector(
        onVerticalDragStart: (d) {
          Navigator.of(context).pop(_currentpage);
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: ThemeHero.background,
                      child: Image.asset(
                        ThemeAssets.background,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Column(
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: ThemeHero.header,
                    child: Header(showCloseButton: true),
                  ),
                  Expanded(
                    child: Container(
                      child: PageView.builder(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) =>
                            setState(() => _currentpage = value),
                        itemBuilder: (context, index) => DetailListItem(
                            index: index, car: _carRepo.getCars()[index]),
                        itemCount: _carRepo.getCars().length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
