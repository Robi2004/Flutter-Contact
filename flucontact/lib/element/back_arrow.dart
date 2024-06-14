import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(20, 40)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(5, 5, 5, 5)),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            elevation: MaterialStateProperty.all(3),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        color: Colors.transparent, width: 1)))),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 50,
        ));
  }
}
