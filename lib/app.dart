import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'screens/login/login_screen.dart';
import 'screens/register/register_screen.dart';
import 'screens/screens_index.dart';
import 'shared/constants/app_theme.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        return DevicePreview.appBuilder(
            context,
            ResponsiveWrapper.builder(child,
                minWidth: 640,
                maxWidth: 1980,
                defaultScale: true,
                breakpoints: const [
                  ResponsiveBreakpoint.resize(480, name: MOBILE),
                  ResponsiveBreakpoint.resize(768, name: TABLET),
                  ResponsiveBreakpoint.resize(1024, name: DESKTOP),
                ]));
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: AppTheme.getLightTheme(),
      routes: {
        Screens.splash: (BuildContext context) => const SplashScreen(),
        Screens.login: (BuildContext context) => LoginScreen(),
        Screens.register: (BuildContext context) => RegisterScreen(),
        Screens.home: (BuildContext context) => const HomeScreen(),
      },
    );
  }
}
