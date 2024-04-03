import 'package:flutter/material.dart';
import 'package:splitwise_clone/screens/authenticate/register/register_screen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Login"),
              ElevatedButton(onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: const Text("Register ?"))
            ],
          )
        ),
      ),
    );
  }
}
