import 'package:flutter/material.dart';

class TemplateForm extends StatefulWidget {
  final Widget sizedBoxChild;
  const TemplateForm({Key? key, required this.sizedBoxChild}) : super(key: key);

  @override
  State<TemplateForm> createState() => _TemplateFormState();
}

class _TemplateFormState extends State<TemplateForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [widget.sizedBoxChild])));
  }
}
