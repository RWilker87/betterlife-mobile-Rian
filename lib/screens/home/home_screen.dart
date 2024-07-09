import 'package:flutter/material.dart';
import '../login/login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final LoginController newController = LoginController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Builder(builder: (BuildContext context) {
      return FutureBuilder(
          builder: (context, snapshot) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: null);
    });
  }
}