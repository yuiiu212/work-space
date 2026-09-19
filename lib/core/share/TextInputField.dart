import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';

class TextInputField extends StatelessWidget {
  final String title;
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextInputField({
    super.key,
    required this.title,
    this.hintText,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final obscureTextNotifier = ValueNotifier<bool>(isPassword);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyleManager.textStyleNeutralPrimarySB16(context)),
        SizedBox(height: Units.getHeight(context: context, value: 12)),
        ValueListenableBuilder<bool>(
          valueListenable: obscureTextNotifier,
          builder: (context, isObscured, _) {
            return TextFormField(
              controller: controller,
              obscureText: isObscured,
              validator: validator ?? (val) => (val == null || val.isEmpty) ? 'needed' : null,
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: ColorManager.NeutralBackground,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => obscureTextNotifier.value = !isObscured,
                      )
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}