import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:BetSweet/ui/widgets/customIcons.dart';

// define an enum for the sizes

class IconButtom extends StatelessWidget {
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
  IconButtom({
    required this.text,
    required this.onPressed,
    this.color,
    required this.iconPath,
    this.size = ButtonSize.m,
    this.customSize,
  });

  @override
  Widget build(BuildContext context) {
    // define a map of sizes to fixed sizes
    Map<ButtonSize, Size> sizes = {
      ButtonSize.l: Size(250, 40),
      ButtonSize.m: Size(150, 33),
      ButtonSize.s: Size(80, 20),
    };

    return ElevatedButton(
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        CustomIcon(
          iconPath: iconPath,
        ),
        SizedBox(width: (customSize?.height ?? sizes[size]!.height) / 2),
        Text(text),
      ]),

      style: ElevatedButton.styleFrom(
        // use the customColor parameter if not null, otherwise use the color parameter from the map
        primary: color ?? AppColors.accentColor, // background color
        onPrimary: Colors.white, // text color
        // use the customSize parameter if not null, otherwise use the size parameter from the map
        fixedSize: customSize ?? sizes[size], // button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // border radius
        ),
      ),
      onPressed: onPressed, // use the onPressed parameter here
    );
  }
}
