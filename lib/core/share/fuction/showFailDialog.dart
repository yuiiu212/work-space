import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/style/AssetsManager.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';
import 'package:lottie/lottie.dart';


void showFailDialog({
  required BuildContext context,
  required String failMessage,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.NeutralBackground,
          borderRadius: .circular(Units.radius(context: context, value: 20)),
        ),
        padding: .all(10),
        margin: .symmetric(
          horizontal: Units.getHeight(context: context, value: 20),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(alignment: .topEnd, child: CloseButton()),
            Lottie.asset(
              AssetsManager.FailIcon,
              width: Units.getHeight(context: context, value: 160),
              height: Units.getWidth(context: context, value: 160),
            ),
            Text(
              failMessage,
              style: TextStyleManager.textStyleNeutralPrimarySB16(context),
            ),
          ],
        ),
      ),
    ),
  );
}