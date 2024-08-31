import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zakariae_marbre/presentation/screens/add_article_screen.dart';
import 'package:zakariae_marbre/presentation/screens/types_screen.dart';
import 'package:zakariae_marbre/presentation/widgets/button_widget.dart';
import 'package:zakariae_marbre/presentation/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<String> signIn(emailAddress, password) async {
    try {
      final creds = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return "Authentication succeed";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return e.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(),
        pwdController = TextEditingController();
    String auth;
    return Scaffold(
      body: Center(
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              controller: emailController,
              labelText: "Email",
              hintText: "",
              hidden: false,
            ),
            const SizedBox(
              height: 35.0,
            ),
            TextFieldWidget(
                controller: pwdController,
                labelText: "Password",
                hintText: "",
                hidden: true),
            const SizedBox(
              height: 35.0,
            ),
            ButtonWidget(
              buttonText: "Login",
              onPressed: () async => {
                auth = await signIn(emailController.text, pwdController.text),
                if (auth == "Authentication succeed")
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TypesScreen()))
                  }
                else
                  {print(auth)}
              },
            )
          ],
        )),
      ),
    );
  }
}
