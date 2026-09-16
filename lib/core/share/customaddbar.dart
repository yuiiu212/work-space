import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/style/AssetsManager.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';

class CustomeAppBar extends StatefulWidget {
  const CustomeAppBar({super.key});

  @override
  State<CustomeAppBar> createState() => _CustomeAppBarState();
}

class _CustomeAppBarState extends State<CustomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(
        horizontal: Units.getHeight(context: context, value: 24),
        vertical: Units.getHeight(context: context, value: 24)
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text('Work space', style: TextStyleManager.textStyleNeutralPrimarySB24(context)),
              Text('Best platform for creating to-do lists', style: TextStyleManager.textStyleNeutralSecondaryR14(context),)
            ],
          ),
          Image.asset(AssetsManager.Setting),
        ],
      ),
    );
  }
}