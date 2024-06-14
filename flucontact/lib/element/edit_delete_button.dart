import 'package:flutter/material.dart';
import '../element/back_arrow.dart';
import '../class/contact.dart';
import '../function/function.dart';

class EditDeleteButton extends StatelessWidget {
  const EditDeleteButton({
    super.key,
    required this.contact,
  });
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Align(
        alignment: AlignmentDirectional(-1, -0.94),
        child: BackArrow(),
      ),
      Align(
          alignment: const AlignmentDirectional(0.9, -0.94),
          child: SizedBox(
            width: 130,
            child: Row(children: [
              IconButton(
                  onPressed: () {
                    goToEditPage(context, contact);
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(20, 40)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(5, 5, 5, 5)),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF008E4F)),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                      )),
                      elevation: MaterialStateProperty.all(3),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  color: Colors.transparent, width: 1)))),
                  icon: const Icon(
                    Icons.edit_square,
                    color: Colors.black,
                    size: 50,
                  )),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    opendialog("Supprimer le contact ?", contact, context);
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(20, 40)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(5, 5, 5, 5)),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF008E4F)),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                      )),
                      elevation: MaterialStateProperty.all(3),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  color: Colors.transparent, width: 1)))),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 50,
                  )),
            ]),
          )),
    ]);
  }
}
