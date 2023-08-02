import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/buttons/gradientButtom.dart';
import 'constants.dart';

import 'package:carousel_slider/carousel_slider.dart';

class GradientButtonCarousel extends StatefulWidget {
  final List<GradientButtom> buttons;

  GradientButtonCarousel({required this.buttons});

  @override
  _GradientButtonCarouselState createState() => _GradientButtonCarouselState();
}

class _GradientButtonCarouselState extends State<GradientButtonCarousel> {
  Map<ButtonSize, Size> sizes = {
    ButtonSize.l: Size(220, 81.5),
    ButtonSize.m: Size(195, 65),
    ButtonSize.s: Size(175, 50.05),
  };
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double buttonWidth =
        sizes[widget.buttons[_currentIndex % widget.buttons.length].size]!
            .width;
    double buttonHeight =
        sizes[widget.buttons[_currentIndex % widget.buttons.length].size]!
            .height;
    // print(buttonHeight);
    double totalButtonWidth = widget.buttons
        .fold(0, (sum, button) => sum + sizes[button.size]!.width);
    int promedioWidth = (totalButtonWidth / widget.buttons.length).floor();
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonsPerPage = (screenWidth / promedioWidth);
    buttonsPerPage = buttonsPerPage > 0 ? buttonsPerPage : 1;
    double viewportFraction = 100 / (buttonsPerPage);
    viewportFraction = viewportFraction / 100;
    PageController _pageController =
        PageController(viewportFraction: viewportFraction);

    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: buttonHeight,
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CarouselSlider.builder(
                  itemCount: widget.buttons.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    double buttonWidth =
                        sizes[widget.buttons[index].size]!.width + 20;
                    return Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: SizedBox(
                        width: buttonWidth,
                        child: widget.buttons[index],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: buttonHeight,
                    autoPlay: true,
                    viewportFraction: viewportFraction,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
