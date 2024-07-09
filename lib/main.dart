import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'screens/home/home_screen_controller.dart';
import 'screens/login/login_controller.dart';
import 'screens/login/login_repository.dart';
import 'shared/core/models/user_model.dart';

main() async {
  runApp(DevicePreview(
      enabled: false,
      builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(create: (_) => HomeScreenController()),
            ChangeNotifierProvider(create: (_) => LoginRepository()),
             ChangeNotifierProvider(create: (_) => UserModel()),
            ChangeNotifierProvider(create: (_) => LoginController()),
          ], child: const App())));
}
