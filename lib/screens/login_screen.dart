import 'package:flutter/material.dart'; // Importa a biblioteca Flutter para usar widgets e outros recursos.
import '../widgets/custom_text_field.dart'; // Importa o widget customizado 'CustomTextField' da pasta widgets.

class LoginScreen extends StatelessWidget { // Define uma classe 'LoginScreen' que é um widget sem estado (Stateless).
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController(); 

  @override
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text('Login'), 
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
            SizedBox(height: 20), 
            ElevatedButton( 
              onPressed: () { 
                // Adicionar ação para o botão de login.
              },
              child: Text('Login'), 
            ),
            TextButton( 
              onPressed: () { 
                Navigator.pushNamed(context, '/register'); 
              },
              child: Text('Não tem uma conta? Cadastre-se aqui!'), 
            ),
          ],
        ),
      ),
    );
  }
}
