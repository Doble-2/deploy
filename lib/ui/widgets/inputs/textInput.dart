import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextInput extends StatelessWidget {
  final String text;
  final ButtonSize size;
  final Size? customSize;
  final String? iconPath;
  final TextEditingController?
      controller; // agregar el controlador como parámetro opcional

  TextInput({
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
      height: customSize?.height ?? sizes[size]!.height,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.secondaryColor,
        controller: controller, // asignar el controlador al TextField
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.secondaryColor)),
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
          hintText: text,
          hintStyle: TextStyle(
            color: AppColors.grey,
          ),
          isDense: true,
          prefixIcon: iconPath != null
              ? InkWell(
                  child: Container(
                      width: 20,
                      padding: const EdgeInsets.all(7.0),
                      child: Center(
                        child: SvgPicture.asset(
                          iconPath!,
                          height: 20,
                          width: 20,
                          fit: BoxFit.fitWidth,
                          color: Colors.white,
                        ),
                      )),
                )
              : null,
        ),
        style: TextStyle(),
      ),
    );
  }
}
