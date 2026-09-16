import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';


class Custome_tab extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const Custome_tab({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Stack(
            
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(image),

              Container(
                height: Units.getHeight(
                  context: context,
                  value: 40,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      ColorManager.NeutralWhite,
                      ColorManager.NeutralWhite,
                      ColorManager.NeutralWhite.withAlpha(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: Units.getHeight(
            context: context,
            value: 12,
          ),
        ),

        Text(
          title,
          style: TextStyleManager.textStyleNeutralPrimarySB26(
            context,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(
          height: Units.getHeight(
            context: context,
            value: 8,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            description,
            style: TextStyleManager.textStyleNeutralSecondaryR14(
              context,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}