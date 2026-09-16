import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/navigation/routes.dart';
import 'package:flutter_application_1/core/share/TextInputField.dart';
import 'package:flutter_application_1/core/share/custommainbtn.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:go_router/go_router.dart';


class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _signin();
}

class _signin extends State<Signin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Units.getHeight(context: context, value: 24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: Units.getHeight(context: context, value: 40)),

              Center(
                child: Text(
                  'Welcome Back!',
                  style: TextStyleManager.textStyleNeutralPrimarySB24(context),
                ),
              ),
              SizedBox(height: Units.getHeight(context: context, value: 8)),
              Center(
                child: Text(
                  'Your work faster and structured with Taskflow',
                  style: TextStyleManager.textStyleNeutralSecondaryR14(context),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: Units.getHeight(context: context, value: 48)),

              TextInputField(
                title: 'Email Address',
                hintText: 'name@example.com',
              ),

              SizedBox(height: Units.getHeight(context: context, value: 24)),

              TextInputField(
                title: 'Password',
                hintText: '••••••••••••••••',
                isPassword: true,
              ),

              const Spacer(),

              CutomeMainBtn(
                onPressed: () {
                  context.pushReplacement(Routes.kHome);
                },
                btnTitle: 'Continue',
              ),
              SizedBox(height: Units.getHeight(context: context, value: 16)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyleManager.textStyleNeutralSecondaryR14(
                        context,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style:
                              TextStyleManager.textStyleBrandPrimaryDefaultB14(
                                context,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(Routes.kRegister);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: Units.getHeight(context: context, value: 24)),
            ],
          ),
        ),
      ),
    );
  }
}