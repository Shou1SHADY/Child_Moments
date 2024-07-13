import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/cubits/auth/auth_cubit.dart';
import 'package:child_moments/cubits/home/home_cubit.dart';
import 'package:child_moments/cubits/invoice/invoice_cubit.dart';
import 'package:child_moments/cubits/kid/add_kid/add_kid_cubit.dart';
import 'package:child_moments/cubits/kid/kid_cubit.dart';
import 'package:child_moments/cubits/teacher/addteacher/addteacher_cubit.dart';
import 'package:child_moments/cubits/teacher/getteacher/getteacher_cubit.dart';
import 'package:child_moments/cubits/teacher/teacher_cubit.dart';
import 'package:child_moments/modules/auth/login_screen.dart';
import 'package:child_moments/modules/dashboard/dashboard.dart';
import 'package:child_moments/modules/invoices/details.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

import '../layout/home_page.dart';

class MyApp extends StatelessWidget {
  // TextEditingController x = TextEditingController();
  // TextEditingController y = TextEditingController();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
          primaryColor: Colors.white,
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          //     primarySwatch: Color.fromARGB(255, 205, 205, 205),
          //  accentColor: Colors.amber,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          //  accentColor: Colors.amber,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => AddKidCubit()),
                BlocProvider(create: (_) => KidCubit()),
                BlocProvider(create: (_) => GetTeacherCubit()),
                BlocProvider(create: (_) => HomeCubit()),
                BlocProvider(create: (_) => AuthCubit()),
                BlocProvider(create: (_) => AddTeacherCubit()),
                BlocProvider(create: (_) => InvoiceCubit()),
                BlocProvider(create: (_) => TeacherCubit()),
              ],
              child: ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (BuildContext context, Widget? child) {
                  return MaterialApp(
//////nav//////////////////
                    navigatorKey: NavigationService.navigationKey,
                    onGenerateRoute: (RouteSettings settings) {
                      switch (settings.name) {
                        case '/':
                          return MaterialPageRoute(
                              builder: (_) => const MyHomePage());
                        case '/modules/invoices/details':
                          return MaterialPageRoute(
                              builder: (_) =>
                                  Details(message: settings.arguments));
                        default:
                          return null;
                      }
                    },

//////////////////////////

                    debugShowCheckedModeBanner: false,
                    theme: theme,
                    darkTheme: darkTheme,
                    home: CacheHelper.getData(key: "email") != null
                        ? const Darshboard()
                        : LoginScreen(),
                  );
                },
                //    child: const MyHomePage(),
              ),
            ));
  }
}
