import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/navigation/routes.dart';
import 'package:flutter_application_1/core/style/AssetsManager.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.NeutralBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset(AssetsManager.logoApp, width: 120, height: 120),
            const SizedBox(height: 24),

          
            Text(
              'work space',
              style: TextStyleManager.textStyleNeutralPrimaryB24(context),
            ),
            const SizedBox(height: 12),

            
           
          ],
        ),
      ),
    );
  }

  void routingtoOnboarding() {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.pushReplacement(Routes.kOnboardingView);
    });
  }

  @override
  void initState() {
    routingtoOnboarding();
    super.initState();
  }
}