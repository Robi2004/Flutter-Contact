import 'package:flucontact/element/user_form.dart';
import 'package:flutter/material.dart';
import '../element/header.dart';
import '../element/title_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: const Scaffold(
            backgroundColor: Colors.white,
            body: Column(mainAxisSize: MainAxisSize.max, children: [
              Header(),
              Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              TitlePage(title: "Connexion"),
              Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              UserForm(
                login: "Connexion",
              ),
            ])));
  }
}
