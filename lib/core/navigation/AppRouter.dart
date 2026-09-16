import 'package:flutter_application_1/core/form/signin.dart';
import 'package:flutter_application_1/core/form/signup.dart';
import 'package:flutter_application_1/core/navigation/routes.dart';
import 'package:flutter_application_1/feature/home/presentation/view/homeview.dart' show HomeView;
import 'package:flutter_application_1/feature/onboarding/onboardingview.dart';
import 'package:flutter_application_1/feature/splash/splashview.dart';
import 'package:flutter_application_1/feature/welcome/welcome.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
   static final GoRouter appRouter = GoRouter(routes: routes);
  static List<GoRoute> routes = [
    GoRoute(path: Routes.kSplashView, builder: (context, state)=> SplashView()),
    GoRoute(path: Routes.kOnboardingView, builder: (context, state)=> OnboardingView()),
    GoRoute(path: Routes.kWelcome, builder: (context, state)=> WelcomeView()),
    GoRoute(path: Routes.kLogin, builder: (context, state)=> Signin()),
    GoRoute(path: Routes.kRegister, builder: (context, state)=> Signup()),
    GoRoute(path: Routes.kHome, builder: (context, state)=> HomeView()),

  ];
}