import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login_repository.dart';
import '../screens_index.dart';

class SplashScreenController {
  final BuildContext context;
  final _api = LoginRepository();
  SplashScreenController(this.context);
  final Logger _logger =
      Logger('Splash screen logger'); 


  void initApplication() async {
    Future.delayed(const Duration(seconds: 3), () async {
      if (await userHasToken()) {
        // ignore: use_build_context_synchronously
        signIn(context);
      } else {
          // ignore: use_build_context_synchronously
          Navigator.popAndPushNamed(context, Screens.login);

      }
    });
  }

  Future configDefaultAppSettings() async {
    _logger.config('Configuring default app settings...');
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _logger.fine('Default app settings configured!');
    return;
  }

  void signIn(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final password = prefs.getString('password');
    // ignore: use_build_context_synchronously
    _api.login(context, email!, password!).then((value) {
      if (value == true) {
        log('Successfully auto signed in');
        Navigator.popAndPushNamed(context, Screens.home);
      } else {
        log('failed to log with email: $email and password: $password now going to sign in screen');
        Navigator.popAndPushNamed(context, Screens.login);
      }
    });
  }

  Future<bool> userHasToken() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final token = prefs.getString('token');
    if (token != null) {
      log('user has token');
      log(email!);
      log(token);
      return true;
    } else {
      log('user has no token');
      return false;
    }
  }
}
