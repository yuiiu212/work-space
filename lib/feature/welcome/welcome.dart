import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/navigation/routes.dart' show Routes;
import 'package:flutter_application_1/core/share/custommainbtn.dart';
import 'package:flutter_application_1/core/style/AssetsManager.dart' show AssetsManager;
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart' show ColorManager;
import 'package:flutter_application_1/feature/onboarding/tabs/customtab.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Units.getHeight(context: context, value: 20),
                    ),

                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'Welcome To ',
                          style: TextStyleManager.textStyleNeutralPrimaryB24(context),
                        ),
                        Text(
                          'Workspace',
                          style:
                              TextStyleManager.textStyleBrandPrimaryDefaultB24(context),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 20),
                    ),

                    SizedBox(
                      width: maxWidth > 360 ? 300 : maxWidth * 0.8,
                      child: Custome_tab(
                        image: AssetsManager.Welcomeview,
                        title: '',
                        description: '',
                      ),
                    ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 30),
                    ),

                    CutomeMainBtn(
                      textColor: ColorManager.NeutralWhite,
                      onPressed: () {
                        context.pushReplacement(Routes.kLogin);
                      },
                      btnTitle: 'Continue with Email',
                      customeContent: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsManager.Mssage,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Continue with Email',
                              style: TextStyleManager
                                  .textStyleNeutralWhiteM18(context),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 16),
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Divider(
                          color: ColorManager.NeutralLine,
                          thickness: 1,
                        ),
                        Container(
                          color: ColorManager.NeutralWhite,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'or continue with',
                            style: TextStyleManager
                                .textStyleNeutralSecondaryR14(context),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 16),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: CutomeMainBtn(
                            height: 56,
                            btncolor: ColorManager.btn,
                            onPressed: () {},
                            btnTitle: 'Facebook',
                            customeContent: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AssetsManager.Facebook,
                                    width: Units.getWidth(
                                        context: context, value: 20),
                                    height: Units.getHeight(
                                        context: context, value: 20),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Facebook',
                                    style: TextStyleManager
                                        .textStyleNeutralPrimaryM16(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Units.getWidth(context: context, value: 12),
                        ),
                        Expanded(
                          child: CutomeMainBtn(
                            height: 56,
                            btncolor: ColorManager.btn,
                            onPressed: () {},
                            btnTitle: 'Google',
                            customeContent: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AssetsManager.Google,
                                    width: Units.getWidth(
                                        context: context, value: 20),
                                    height: Units.getHeight(
                                        context: context, value: 20),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Google',
                                    style: TextStyleManager
                                        .textStyleNeutralPrimaryM16(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Units.getHeight(context: context, value: 20),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}