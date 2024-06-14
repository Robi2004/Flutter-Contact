import 'package:flutter/material.dart';
import '../class/contact.dart';
import '../function/function.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key, required this.valid, required this.contact});
  final String valid;
  final Contact contact;

  @override
  // ignore: library_private_types_in_public_api
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    RegExp normalReg = RegExp('^([A-zÀ-ú-\s]){2,255}\$');
    RegExp numberReg = RegExp('^[0-9]{1,3}\$');
    final Contact newContact = widget.contact;
    return SizedBox(
      width: screenWidth * 0.7,
      height: screenHeight * 0.7 - 9,
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
                    } else if (!normalReg.hasMatch(value)) {
                      return 'Ne correspond pas au critère de validation.';
                    }
                  },
                  initialValue: widget.contact.lastname,
                  onChanged: (String? value) {
                    if (value != null) {
                      newContact.lastname = value;
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: 'Nom',
                      hintText: 'Nom',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                TextFormField(
                  initialValue: widget.contact.firstname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le champ ne peut pas être vide.';
                    } else if (!normalReg.hasMatch(value)) {
                      return 'Ne correspond pas au critère de validation.';
                    }
                  },
                  onChanged: (String? value) {
                    if (value != null) {
                      newContact.firstname = value;
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: 'Prénom',
                      hintText: 'Prénom',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: widget.contact.age,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le champ ne peut pas être vide.';
                    } else if (!numberReg.hasMatch(value)) {
                      return 'Votre contact peut avoir entre 1 et 999 ans';
                    }
                  },
                  onChanged: (String? value) {
                    if (value != null) {
                      newContact.age = value;
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: 'Age',
                      hintText: 'Age',
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
                            if (widget.valid == "Ajouter") {
                              opendialog(
                                  "Ajouter le contact ?", newContact, context);
                            } else {
                              opendialog(
                                  "Modifier le contact ?", newContact, context);
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
                                        color: Colors.transparent, width: 1)))),
                        child: Text(
                          widget.valid,
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
                        onPressed: () {
                          Navigator.pop(context);
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
                                        color: Colors.transparent, width: 1)))),
                        child: const Text(
                          'Annuler',
                          style: TextStyle(
                            fontFamily: 'Cocon',
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ])
              ])),
    );
  }
}
