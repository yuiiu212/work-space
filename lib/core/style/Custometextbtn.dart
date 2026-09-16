import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';


class CustomeTxtBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String BtnTitle;
  final double? fontSize;
  final Color? btncolor;
  final FontWeight? fontWeight;
  const CustomeTxtBtn({
    super.key,
    required this.onPressed,
    required this.BtnTitle,
    this.btncolor,
    this.fontSize,
    this.fontWeight,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(BtnTitle, style: TextStyle(
      color: btncolor?? ColorManager.BrandPrimaryDefault,
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? .w500
    )));
  }
}