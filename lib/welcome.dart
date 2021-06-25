import 'package:flutter/material.dart';
import 'package:cryptapp/slide.dart';
import 'package:cryptapp/login.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Route route = MaterialPageRoute(builder: (context) => Login());
  int _indexPages = 0;
  PageController _controller = PageController();

  List<Widget> _widgetPages = [
    SlidesPage(
      slideTitle: "Saving",
      slideDesc:
          "Accept bitcoins and digital assets, and either store them here or send them to others.",
      slideImg: "assets/keep.svg",
    ),
    SlidesPage(
      slideTitle: "Buy",
      slideDesc:
          "Using VISA, MasterCard, Virtual Bank Account, and a variety of other payment methods, you may purchase Bitcoin and other cryptocurrencies immediately in the app.",
      slideImg: "assets/buy.svg",
    ),
    SlidesPage(
      slideTitle: "Sell",
      slideDesc:
          "You can sell your Bitcoin cryptocurrency or exchange them for other digital assets or cash.",
      slideImg: "assets/sell.svg",
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _indexPages = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onChanged,
            controller: _controller,
            itemCount: _widgetPages.length,
            itemBuilder: (context, int index) {
              return _widgetPages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List<Widget>.generate(_widgetPages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _indexPages) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _indexPages)
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  (_indexPages == (_widgetPages.length - 1))
                      ? Navigator.pushReplacement(context, route)
                      : _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 400),
                  height: 70,
                  width: (_indexPages == (_widgetPages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35)),
                  child: (_indexPages == (_widgetPages.length - 1))
                      ? Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
