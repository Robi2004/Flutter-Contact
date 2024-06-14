import 'package:flutter/material.dart';
import '../function/function.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key, required this.goHomePage, required this.goAddPage})
      : super(key: key);
  final bool goHomePage;
  final bool goAddPage;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    Color colorHomePage = const Color(0xFF008E4F);
    Color colorAddPage = const Color(0xFF008E4F);
    (goAddPage ? null : colorAddPage = const Color(0xFF005E58));
    (goHomePage ? null : colorHomePage = const Color(0xFF005E58));
    return SizedBox(
        width: screenWidth,
        height: screenHeight * 0.12,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: screenWidth * 0.5 - 1.5,
              height: screenHeight * 1,
              child: Stack(children: [
                IconButton(
                  onPressed: () {
                    (goHomePage ? goToHomePage(context) : null);
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(screenWidth, screenHeight)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(24, 0, 24, 0)),
                      backgroundColor: MaterialStateProperty.all(colorHomePage),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                      )),
                      elevation: MaterialStateProperty.all(3),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: const BorderSide(
                                  color: Colors.transparent, width: 1)))),
                  icon: const Icon(
                    Icons.format_list_bulleted_rounded,
                    color: Colors.black,
                    size: 100,
                  ),
                ),
              ]),
            ),
            const VerticalDivider(
              width: 3,
              thickness: 3,
              color: Colors.black,
            ),
            SizedBox(
              width: screenWidth * 0.5 - 1.5,
              height: screenHeight * 1,
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      (goAddPage ? goToAddPage(context) : null);
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(screenWidth, screenHeight)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(24, 0, 24, 0)),
                        backgroundColor:
                            MaterialStateProperty.all(colorAddPage),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                        )),
                        elevation: MaterialStateProperty.all(3),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    side: const BorderSide(
                                        color: Colors.transparent, width: 1)))),
                    icon: const Icon(
                      Icons.person_add_alt_1,
                      color: Colors.black,
                      size: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
