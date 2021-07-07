//Text con estilo de fuente personalizado
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  //Variables
  int lines;
  String title;
  final controller = TextEditingController();

  CustomTextField({this.lines, this.title});

  void _printLatestValue() {
    print('Second text field: ${controller.text}');
  }

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(widget._printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(
          data: widget.title,
          size: 14,
          color: grayText,
          weight: FontWeight.bold),
      Container(
          height: 20 * widget.lines.toDouble() + 16,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(4),
          child: TextField(
              controller: widget.controller,
              autofocus: false,
              maxLines: widget.lines,
              textAlign: TextAlign.justify))
    ]);
  }
}
