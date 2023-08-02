import 'package:flutter/material.dart';
import 'package:BetSweet/ui/widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SelectCountry extends StatelessWidget {
  final TextEditingController? controller;
  SelectCountry({this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 55,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          border: Border.all(
            color: AppColors.secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: CountryCodePicker(
          onChanged: (CountryCode countryCode) {
            controller?.text = countryCode.toString();
          },
          countryFilter: const [
            'ES',
            'VE',
            'CO',
            'MX',
            'AR',
            'PE',
            'CL',
            'EC',
            'GT',
            'CU',
            'BO',
            'DO',
            'HN',
            'PY',
            'SV',
            'NI',
            'CR',
            'PA',
            'PR',
            'UY',
            'GQ',
            'BZ',
          ],
          initialSelection: 'ES',
          alignLeft: true,
          textStyle: TextStyle(
            color: Colors.white,
          ),
          searchStyle: TextStyle(
            color: AppColors.grey,
          ),
          boxDecoration: BoxDecoration(),
          flagWidth: 25,
        ),
      ),
    );
  }
}
