import 'package:flutter/material.dart';
import '../function/function.dart';

class UserForm extends StatefulWidget {
  const UserForm({
    super.key,
    required this.login,
  });

  final String login;
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String email = "";
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    RegExp normalReg = RegExp('^([A-zÀ-ú-\s]){2,255}\$');
    RegExp emailReg = RegExp(
        '^([A-zÀ-ú-0-9.\s]{1,255}@([A-zÀ-ú-\s]){1,255}.[A-zÀ-ú-\s]{2,4})\$');
    RegExp passwordReg = RegExp('^([!@#%^&*_+-=",.?A-zÀ-ú-\s]){4,255}\$');
    return SizedBox(
        width: screenWidth * 0.7,
        height: screenHeight * 0.82 - 6,
        child: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Le champ ne peut pas être vide.';
                      } else if (!emailReg.hasMatch(value)) {
                        return 'Votre adresse mail n\'a pas le bon format';
                      }
                    },
                    onChanged: (String? value) {
                      if (value != null) {
                        email = value;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Email',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        border: OutlineInputBorder()),
                  ),
                  if (widget.login != "Connexion")
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  if (widget.login != "Connexion")
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Le champ ne peut pas être vide.';
                        } else if (!normalReg.hasMatch(value)) {
                          return 'Ne correspond pas au critère de validation.';
                        }
                      },
                      onChanged: (String? value) {
                        if (value != null) {
                          username = value;
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: "Nom d'utilistateur",
                          hintText: "Nom d'utilistateur",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          border: OutlineInputBorder()),
                    ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Le champ ne peut pas être vide.';
                      } else if (!passwordReg.hasMatch(value)) {
                        return 'Votre MDP doit contenir ou moins\n4 caractères';
                      }
                    },
                    obscureText: true,
                    onChanged: (String? value) {
                      if (value != null) {
                        password = value;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: 'Mot de passe',
                        hintText: 'Mot de passe',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (widget.login == "Connexion") {
                                loginUser(email, password, context);
                              } else {
                                registerUser(
                                    email, username, password, context);
                              }
                            }
                          },
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(screenWidth * 0.3, screenHeight * 0.05)),
                              maximumSize: MaterialStateProperty.all(
                                  Size(screenWidth * 0.3, screenHeight * 0.05)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF008E4F)),
                              textStyle:
                                  MaterialStateProperty.all(const TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                              )),
                              elevation: MaterialStateProperty.all(3),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1)))),
                          child: Text(
                            widget.login,
                            style: const TextStyle(
                              fontFamily: 'Cocon',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          width: 2,
                          thickness: 2,
                          color: Colors.black,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(screenWidth * 0.3, screenHeight * 0.05)),
                              maximumSize: MaterialStateProperty.all(
                                  Size(screenWidth * 0.3, screenHeight * 0.05)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF008E4F)),
                              textStyle:
                                  MaterialStateProperty.all(const TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                              )),
                              elevation: MaterialStateProperty.all(3),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1)))),
                          child: const Text(
                            'Annuler',
                            style: TextStyle(
                              fontFamily: 'Cocon',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextButton(
                      onPressed: () {
                        if (widget.login == "Connexion") {
                          goToRegisterPage(context);
                        } else {
                          goToLoginPage(context);
                        }
                      },
                      child: Text(widget.login == "Connexion"
                          ? 'Créer un compte'
                          : 'Se connecter'))
                ])));
  }
}
