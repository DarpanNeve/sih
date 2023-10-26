import 'package:SIH/Pages/forgot_password.dart';
import 'package:SIH/Pages/registration_page.dart';
import 'package:SIH/Pages/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Api/auth_service.dart';

var _pass = TextEditingController();
var _email = TextEditingController();
bool _obsecureText = true;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 344,
                    height: 500,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'LOGIN ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            controller: _email,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const PasswordButton(),
                        const SizedBox(
                          height: 25,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassword()));
                                },
                                child: const Text(
                                  'Forgot Password ?',
                                  style: TextStyle(color: Colors.lightBlue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            AuthService().signInWithEmailAndPassword(
                                _email.text.toString(),
                                _pass.text.toString(),
                                context);
                          },
                          child: Container(
                            width: RenderErrorBox.minimumWidth,
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xff0077A2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    AuthService().signInWithEmailAndPassword(_email.text, _pass.text, context);
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            AuthService().signInWithGoogle(context);
                          },
                          child: Container(
                            width: RenderErrorBox.minimumWidth,
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xff0077A2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.asset(
                                        'assets/Images/Google.png')),
                                const Text(
                                  "Google",
                                  style: TextStyle(
                                      fontSize: 16,
                                      // Set the text size
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('OR'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Don't Have An Account ? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Register Now ",
                            textWidthBasis: TextWidthBasis.longestLine,
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordButton extends StatefulWidget {
  const PasswordButton({super.key});

  @override
  State<PasswordButton> createState() => _PasswordButtonState();
}

class _PasswordButtonState extends State<PasswordButton> {
  @override
  void dispose() {
    // TODO: implement dispose
    _email.text = "";
    _pass.text = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: _pass,
        obscureText: _obsecureText,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(
                  () {
                    _obsecureText = !_obsecureText;
                  },
                );
              },
              child: _obsecureText
                  ? const Icon(Icons.visibility_off, color: Colors.grey)
                  : const Icon(Icons.visibility, color: Colors.grey)),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
