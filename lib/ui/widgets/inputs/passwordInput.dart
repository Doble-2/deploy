import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fancy_password_field/fancy_password_field.dart';

class PasswordInput extends StatelessWidget {
  final String text;
  final ButtonSize size;
  final Size? customSize;
  final String? iconPath;
  final TextEditingController?
      controller; // agregar el controlador como parámetro opcional

  PasswordInput({
    required this.text,
    this.size = ButtonSize.m,
    this.customSize,
    this.iconPath,
    this.controller, // agregar el controlador como parámetro opcional
  });

  @override
  Widget build(BuildContext context) {
    Map<ButtonSize, Size> sizes = {
      ButtonSize.l: Size(300, 55),
      ButtonSize.m: Size(150, 55),
      ButtonSize.s: Size(100, 55),
    };

    return SizedBox(
        width: customSize?.width ?? sizes[size]!.width,
        child: FancyPasswordField(
          controller: controller, // asignar el controlador al TextField
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondaryColor)),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.accentColor,
              ),
            ),
            hintText: 'Contrasena',
            hintStyle: TextStyle(
              color: AppColors.grey,
            ),
            isDense: true,
            prefixIcon: Icon(
              Icons.lock,
              size: 30,
            ),
          ),
          validationRules: {},
          strengthIndicatorBuilder: (strength) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
            );
          },
        ));
  }
}
