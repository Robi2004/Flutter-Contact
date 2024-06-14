import 'package:flutter/material.dart';
import '../function/function.dart';

class TitlePage extends StatelessWidget {
  final String title;
  const TitlePage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;

    return FutureBuilder<bool>(
      future: doesTokenExist(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data == true) {
            return buildWithLogoutButton(screenWidth, screenHeight, context);
          } else {
            return buildWithoutLogoutButton(screenWidth, screenHeight);
          }
        } else {
          return Container(); // Placeholder pendant le chargement
        }
      },
    );
  }

  Widget buildWithLogoutButton(
      double screenWidth, double screenHeight, BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.06,
      decoration: const BoxDecoration(
        color: Color(0xFF008E4F),
        shape: BoxShape.rectangle,
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(-0.98, 1),
            child: IconButton(
              onPressed: () {
                removeAuthToken(context);
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(50, 50)),
                elevation: MaterialStateProperty.all(3),
              ),
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Cocon',
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWithoutLogoutButton(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.06,
      decoration: const BoxDecoration(
        color: Color(0xFF008E4F),
        shape: BoxShape.rectangle,
      ),
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Cocon',
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
