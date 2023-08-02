// Importing the necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Creating a StatelessWidget for a custom icon
class CustomIcon extends StatelessWidget {
  // Defining the icon path as a final variable
  final String iconPath;

  // Constructor for the CustomIcon, requiring the icon path
  const CustomIcon({required this.iconPath});

  // Building the widget tree
  @override
  Widget build(BuildContext context) {
    // Returning an SvgPicture widget with the asset defined by the icon path
    return SvgPicture.asset(iconPath);
  }
}
