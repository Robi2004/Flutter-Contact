import 'package:flutter/material.dart';
import '../element/header.dart';
import '../element/title_page.dart';
import '../element/footer.dart';
import '../element/edit_delete_button.dart';
import '../class/contact.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.contact,
  });
  final Contact contact;
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
              const Header(),
              const Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              const TitlePage(title: "Détails du contact"),
              const Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.7 - 9,
                child: Stack(
                  children: [
                    EditDeleteButton(
                      contact: contact,
                    ),
                    Align(
                      child: SizedBox(
                        width: screenWidth,
                        height: screenHeight * 0.10,
                        child: Align(
                          alignment: const AlignmentDirectional(0, 1),
                          child: Column(
                            children: [
                              Text('${contact.firstname} ${contact.lastname}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                  )),
                              Text('${contact.age} ans',
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              const Footer(goHomePage: true, goAddPage: true)
            ])));
  }
}
