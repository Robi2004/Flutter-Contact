import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: screenWidth,
      height: screenHeight * 0.12,
      decoration: const BoxDecoration(
        color: Color(0xFF005E58),
      ),
      child: Stack(
        children: [
          const Align(
            alignment: AlignmentDirectional(0.6, 0.1),
            child: Text(
              'Gestionnaire de contacts',
              style: TextStyle(
                fontFamily: 'Cocon',
                color: Colors.white,
                fontSize: 23,
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.24,
            height: screenHeight * 0.24,
            child: Image.asset(
              'assets/images/flutter.png',
              width: 300,
              height: 222,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
