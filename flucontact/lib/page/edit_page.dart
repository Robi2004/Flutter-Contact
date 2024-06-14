// ignore_for_file: prefer_const_constructors
import 'package:flucontact/element/contact_form.dart';
import 'package:flutter/material.dart';
import '../element/header.dart';
import '../element/title_page.dart';
import '../element/footer.dart';
import '../element/back_arrow.dart';
import '../class/contact.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final Contact contact;

  @override
  // ignore: library_private_types_in_public_api
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(mainAxisSize: MainAxisSize.max, children: [
              Header(),
              Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              TitlePage(title: "Modifier un contact"),
              Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.7 - 9,
                child: Stack(children: [
                  const Align(
                    alignment: AlignmentDirectional(-1, -0.94),
                    child: BackArrow(),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: ContactForm(
                      contact: widget.contact,
                      valid: 'Enregistrer',
                    ),
                  )
                ]),
              ),
              Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              Footer(goHomePage: true, goAddPage: true)
            ])));
  }
}
