import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/style/CustomefontWeight.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';

class CutomeMainBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTitle;
  final Widget? customeContent;
  final Color? btncolor;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? textColor;
  

  const CutomeMainBtn({
    super.key,
    required this.onPressed,
    required this.btnTitle,
    this.btncolor,
    this.customeContent,
    this.height,
    this.width,
    this.fontSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Units.getHeight(
        context: context,
        value: width ?? 327,
      ),
      height: Units.getHeight(
        context: context,
        value: height ?? 56,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor ?? ColorManager.BrandButton,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Units.radius(
                context: context,
                value: 12,
              ),
            ),
          ),
        ),
        child: customeContent ??
            Text(
              btnTitle,
              style: TextStyle(
                color: textColor ?? ColorManager.NeutralWhite,
                fontSize: Units.fontSize(
                  context: context,
                  value: fontSize ?? 18,
                ),
                fontWeight: CustomeFontWeight.medium,
              ),
            ),
      ),
    );
  }
}