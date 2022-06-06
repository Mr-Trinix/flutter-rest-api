import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final globalFormKey = GlobalKey<FormState>();

  String email = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nous contacter')),
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
                      validator: (email) => (email == null || email.isEmpty)
                          ? "veuillez rentrer un email"
                          : null,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "ecrire ici ..",
                        labelText: 'Message',
                      ),
                      onChanged: (value) => setState(() => message = value),
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Le contenu ne peut pas être vide"
                          : null,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      child: const Text('Envoyer'),
                      onPressed: () {
                        dynamic isValidForm =
                            globalFormKey.currentState?.validate();

                        if (isValidForm) {
                          globalFormKey.currentState?.save();

                          final message = '[$email] Email envoyé avec succès !';
                          final snackBar = SnackBar(
                            content: Text(
                              message,
                              style: const TextStyle(fontSize: 20),
                            ),
                            backgroundColor: Colors.green,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
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
        "Formulaire de contact",
        style: TextStyle(fontSize: 25),
      ),
    );
