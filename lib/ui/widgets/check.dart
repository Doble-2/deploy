import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final Color checkColor;
  final String text;
  final bool? isChecked;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    required this.onChanged,
    required this.checkColor,
    required this.text,
    this.isChecked = false,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool? isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  void handleCheckboxChange(bool? newValue) {
    setState(() {
      isChecked = newValue;
    });
    widget.onChanged(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      //   height: 40,
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: handleCheckboxChange,
            activeColor: widget.checkColor,
          ),
          Flexible(
            child: Text(widget.text),
          )
        ],
      ),
    );
  }
}
