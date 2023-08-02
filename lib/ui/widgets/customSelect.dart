import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSelect extends StatelessWidget {
  final String title;
  final List<String> options;
  final TextStyle? style;
  final ValueChanged<String?>? onChanged;
  final String? iconPath;

  final ButtonSize size;
  final Size? customSize;

  CustomSelect({
    required this.title,
    this.size = ButtonSize.m,
    this.customSize,
    required this.options,
    this.style,
    this.iconPath,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Map<ButtonSize, Size> sizes = {
      ButtonSize.l: Size(300, 55),
      ButtonSize.m: Size(150, 55),
      ButtonSize.s: Size(100, 55),
    };

    return Container(
      width: customSize?.width ?? sizes[size]!.width,
      //   height: customSize?.height ?? sizes[size]!.height,
      child: DropdownButtonFormField<String>(
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
          hintText: title,
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
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        // style: TextStyle(color: Colors.red)
      ),
    );
  }
}
