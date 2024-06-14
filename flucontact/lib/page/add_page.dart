// ignore_for_file: prefer_const_constructors
import 'package:flucontact/class/contact.dart';
import 'package:flucontact/element/contact_form.dart';
import 'package:flutter/material.dart';
import '../element/header.dart';
import '../element/title_page.dart';
import '../element/footer.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
              TitlePage(title: "Ajouter un contact"),
              Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              ContactForm(
                contact: Contact(firstname: "", lastname: "", age: ""),
                valid: 'Ajouter',
              ),
              Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              Footer(goHomePage: true, goAddPage: false)
            ])));
  }
}
