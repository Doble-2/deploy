import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';

class GradientButtom extends StatelessWidget {
  // declare the parameters as final variables
  final String text;
  final VoidCallback onPressed;
  // use the Color for the customColor parameter and make it optional with a null value
  final Color? color;
  // use the enum for the size parameter and make it optional with a default value
  final ButtonSize size;
  // use the Size for the customSize parameter and make it optional with a null value
  final Size? customSize;
  final String iconPath;

  // use the required keyword to make the text and onPressed parameters mandatory
  GradientButtom({
    required this.text,
    required this.onPressed,
    this.color,
    this.size = ButtonSize.m,
    this.customSize,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    // define a map of sizes to fixed sizes
    Map<ButtonSize, Size> sizes = {
      ButtonSize.l: Size(210, 81.5),
      ButtonSize.m: Size(185, 65),
      ButtonSize.s: Size(165, 50.05),
    };

    return SizedBox(
      width: sizes[size]!.width,
      height: sizes[size]!.height,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color ?? AppColors.accentColor,
              // color ?? AppColors.accentColor,
              Color.fromARGB(0, 255, 255, 255),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ElevatedButton(
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: sizes[size]!.width * 0.3,
              child: Image.asset(iconPath),
            ),
            SizedBox(width: 5),
            Flexible(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SizedBox(
                      child: Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxHeight * 0.27),
                  ));
                },
              ),
            ),
          ]),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            onPrimary: Colors.white,
            fixedSize: customSize ?? sizes[size],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
