// Importing the necessary packages
import 'package:flutter/material.dart';
// Importing the constants
import 'package:BetSweet/ui/widgets/constants.dart';

// Creating a StatelessWidget for a general button
class GeneralButton extends StatelessWidget {
  // Declaring the text and onPressed parameters as final variables
  final String text;
  final VoidCallback onPressed;
  // Using the Color type for the customColor parameter and making it optional with a null value
  final Color? color;
  // Using the ButtonSize enum for the size parameter and making it optional with a default value of ButtonSize.m
  final ButtonSize size;
  // Using the Size type for the customSize parameter and making it optional with a null value
  final Size? customSize;

  // Using the required keyword to make the text and onPressed parameters mandatory in the constructor
  GeneralButton({
    required this.text,
    required this.onPressed,
    this.color,
    this.size = ButtonSize.m,
    this.customSize,
  });

  // Building the widget tree
  @override
  Widget build(BuildContext context) {
    // Defining a map of button sizes to fixed sizes
    Map<ButtonSize, Size> sizes = {
      ButtonSize.l: Size(250, 40),
      ButtonSize.m: Size(150, 33),
      ButtonSize.s: Size(80, 20),
    };

    // Returning an ElevatedButton widget with the specified parameters
    return ElevatedButton(
      child: Text(text), // Using the text parameter here
      style: ElevatedButton.styleFrom(
        // Using the customColor parameter if not null, otherwise using the accent color from AppColors
        primary: color ?? AppColors.accentColor, // Background color
        onPrimary: Colors.white, // Text color
        // Using the customSize parameter if not null, otherwise using the size from the sizes map based on the size parameter
        fixedSize: customSize ?? sizes[size], // Button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Border radius
        ),
      ),
      onPressed: onPressed, // Using the onPressed parameter here
    );
  }
}
