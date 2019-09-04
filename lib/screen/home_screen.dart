import 'package:flutter/material.dart';
import 'package:flutter_transitions/repository/car_repo.dart';
import 'package:flutter_transitions/route/fade_transition.dart';
import 'package:flutter_transitions/screen/detail_screen.dart';
import 'package:flutter_transitions/util/assets.dart';
import 'package:flutter_transitions/util/colors.dart';
import 'package:flutter_transitions/util/hero.dart';
import 'package:flutter_transitions/widget/header.dart';
import 'package:flutter_transitions/widget/home_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller;
  final carRepo = CarRepo();
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = new PageController(
      initialPage: _currentPage,
      keepPage: true,
      viewportFraction: 0.4,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      body: GestureDetector(
        onVerticalDragStart: (details) {
          onClick();
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: ThemeHero.background,
                    child: Image.asset(
                      ThemeAssets.background,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    height: 250,
                    child: PageView.builder(
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) =>
                          setState(() => _currentPage = value),
                      itemBuilder: (context, index) => HomeListItem(
                        index: index,
                        car: carRepo.getCars()[index],
                        onClick: onClick,
                      ),
                      itemCount: carRepo.getCars().length,
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: ThemeHero.header,
                    child: Header(showCloseButton: false),
                  ),
                  Container(
                    height: height / 6,
                  ),
                  Expanded(
                    child: Center(
                      child: Hero(
                        transitionOnUserGestures: true,
                        tag: ThemeHero.car(_currentPage.toString()),
                        child: Image.asset(
                          carRepo.getCars()[_currentPage].imageUrl,
                          height: height / 3,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onClick() async {
    final currentPage = await Navigator.of(context).push(
      FadeInRoute(
        child: DetailScreen(
          currentPage: _currentPage,
        ),
      ),
    );
    if (currentPage == null) return;
    setState(() {
      _currentPage = currentPage;
      controller.jumpToPage(_currentPage);
    });
  }
}
