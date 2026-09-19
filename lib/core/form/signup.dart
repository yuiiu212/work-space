import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/firebase/auth_services.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/navigation/routes.dart';
import 'package:flutter_application_1/core/share/TextInputField.dart';
import 'package:flutter_application_1/core/share/custommainbtn.dart';
import 'package:flutter_application_1/core/style/TextStyleManager.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _RegisterState();
}

class _RegisterState extends State<Signup> {
  final AuthServices authServices = AuthServices();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Units.getHeight(context: context, value: 24),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: Units.getWidth(context: context, value: 40)),
                Center(
                  child: Text(
                    'Create account',
                    style: TextStyleManager.textStyleNeutralPrimarySB24(context),
                  ),
                ),
                SizedBox(height: Units.getWidth(context: context, value: 8)),
                Center(
                  child: Text(
                    'Create your account and feel the benefits',
                    style: TextStyleManager.textStyleNeutralSecondaryR14(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: Units.getWidth(context: context, value: 48)),

                
                TextInputField(
                  controller: _emailController,
                  title: 'Email Address',
                  hintText: 'name@example.com',
                ),
                SizedBox(height: Units.getWidth(context: context, value: 24)),

                TextInputField(
                  controller: _passwordController,
                  title: 'Password',
                  hintText: '••••••••••••••••',
                  isPassword: true,
                ),

                const Spacer(),

                
                CutomeMainBtn(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await authServices.createAccount(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                        if (context.mounted) {
                          context.pushReplacement(Routes.kHome);
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    }
                  },
                  btnTitle: 'Continue',
                ),
                SizedBox(height: Units.getWidth(context: context, value: 16)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyleManager.textStyleNeutralSecondaryR14(context),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: TextStyleManager.textStyleBrandPrimaryDefaultB14(context),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                               
                                context.pushReplacement(Routes.kLogin);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Units.getWidth(context: context, value: 24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}