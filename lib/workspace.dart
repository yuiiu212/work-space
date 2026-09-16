import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/navigation/AppRouter.dart';
import 'package:flutter_application_1/core/style/AppTheme.dart';
import 'package:flutter_application_1/feature/home/presentation/manager/homecubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class workspace extends StatelessWidget {
  const workspace({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())],
      child: MaterialApp.router(
        title: 'work space',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.appRouter,
        theme: Apptheme.lightTheme,
      ),
    );
  }
}
