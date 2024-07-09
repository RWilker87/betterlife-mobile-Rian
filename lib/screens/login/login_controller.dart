import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/core/models/user_model.dart';
import '../screens_index.dart';
import 'login_repository.dart';

enum LoginStatus {
  done,
  error,
  loading,
  idle,
}

class LoginController with ChangeNotifier {
  final LoginRepository _repository = LoginRepository();
  String? email;
  String? password;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  String? errorMessage;
  var status = LoginStatus.idle;

  void signIn(BuildContext context, String email, String password) async {
    try {
      var succ = await _repository.login(
          context, emailController.text, passwordController.text);

      if (succ) {
        status = LoginStatus.done;
        notifyListeners();
        // ignore: use_build_context_synchronously
        Navigator.popAndPushNamed(context, Screens.home);
      }
      status = LoginStatus.done;
    } catch (e) {
      status = LoginStatus.error;
      setupErrorMessage("Erro ao fazer login, verifique seus dados");
      notifyListeners();
    }
  }

  Future<UserModel> getInstance(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();

    final name = prefs.getString('name');
    final email = prefs.getString('email');
    final token = prefs.getString('token');

    userModel.setUser(name, token, email);

    return userModel;
  }

  void setupErrorMessage(String value) async {
    errorMessage = value;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    errorMessage = null;
    notifyListeners();
  }
}
