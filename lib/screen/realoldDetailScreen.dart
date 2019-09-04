import 'package:flutter/material.dart';

class OldDetailScreen extends StatefulWidget {
  @override
  _OldDetailScreenState createState() => _OldDetailScreenState();
}

class _OldDetailScreenState extends State<OldDetailScreen> {
  PageController controller;
  var _height = 400.0;
  var _currentpage = 0;

  @override
  void initState() {
    super.initState();

    controller = new PageController(
      initialPage: _currentpage,
      keepPage: true,
      viewportFraction: 0.5,
    );
    delayed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VROOM'),
      ),
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                height: _height,
                child: Image.network(
                  'https://ichef.bbci.co.uk/news/660/cpsprodpb/C342/production/_88068994_thinkstockphotos-493881770.jpg',
                  fit: BoxFit.cover,
                ),
                curve: Curves.easeInOut,
                duration: Duration(seconds: 1),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            child: PageView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onHorizontalDragUpdate: (value) {
                    print(value);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    height: 150,
                    width: 150,
                    child: Image.network(
                        "https://www.carlogos.org/logo/BMW-logo-2000-2048x2048.png"),
                  ),
                ),
              ),
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> delayed() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _height = _height == 400 ? 200 : 400;
    });
    delayed();
  }
}
