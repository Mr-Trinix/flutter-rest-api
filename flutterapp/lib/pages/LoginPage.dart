import 'package:flutter/material.dart';
import 'package:flutterapp/api/apiManager.dart';
import 'package:flutterapp/pages/HomePage.dart';
import 'package:flutterapp/routes/routes.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Form(
        key: globalFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    homeTitle(),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "email ici ..",
                        labelText: 'Email',
                      ),
                      onChanged: (value) => setState(() => email = value),
                      onSaved: (value) => email = value!,
                      validator: (email) => (email == null || email.isEmpty)
                          ? "veuillez rentrer un email"
                          : null,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "* * * * * * * * *",
                        labelText: 'Mot de passe',
                      ),
                      onChanged: (value) => setState(() => password = value),
                      onSaved: (value) => password = value!,
                      validator: (password) =>
                          (password == null || password.isEmpty)
                              ? "Le mot de passe ne peux pas être vide"
                              : null,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        dynamic isValidForm =
                            globalFormKey.currentState?.validate();
                        if (isValidForm) {
                          globalFormKey.currentState?.save();
                          ApiManager.login(context, email, password);
                        }
                      },
                      child: const Text('Se connecter'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

Widget homeTitle() => Container(
      margin: const EdgeInsets.fromLTRB(00, 00, 0, 45),
      child: const Text(
        "Page de connexion",
        style: TextStyle(fontSize: 25),
      ),
    );
