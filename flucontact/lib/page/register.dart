import 'package:flucontact/element/user_form.dart';
import 'package:flutter/material.dart';
import '../element/header.dart';
import '../element/title_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              TitlePage(title: "Créer un compte"),
              Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              UserForm(
                login: "Créer",
              ),
            ])));
  }
}
