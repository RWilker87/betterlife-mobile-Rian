import 'package:betterlife/screens/login/login_controller.dart';
import 'package:flutter/material.dart';
import '../../../screens/screens_index.dart';
import '../../constants/style_constants.dart';

// ignore: must_be_immutable
class AddUserDialog extends StatefulWidget {
  String email;
  String password;
  AddUserDialog(
    this.email,
    this.password, {
    super.key,
  });

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  @override
  Widget build(BuildContext context) {
    LoginController controller = LoginController();
    return AlertDialog(
      title: const Text(
        'Adicionar conta',
        style: TextStyle(
          color: kText,
          fontSize: 20,
        ),
      ),
      content: const Text(
        'Usuário adicionado com sucesso!',
        style: TextStyle(
          color: kText,
          fontSize: 15,
        ),
      ),
      actions: [
        Center(
          child: Wrap(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, Screens.login);
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'Vamos lá!',
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDetailColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
