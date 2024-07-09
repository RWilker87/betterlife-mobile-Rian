import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              controller: _emailController,
              labelText: 'Email',
              obscureText: false,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Senha',
              obscureText: true,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: _confirmPasswordController,
              labelText: 'Confirmar Senha',
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicionar ação para o botão de cadastro.
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
