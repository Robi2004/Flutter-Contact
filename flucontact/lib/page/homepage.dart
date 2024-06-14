import 'package:flutter/material.dart';
import '../element/header.dart';
import '../element/title_page.dart';
import '../element/footer.dart';
import '../class/contact.dart';
import '../function/function.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  List<Contact>? listContact;
  String searchText = '';

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
              const TitlePage(title: "Liste des contacts"),
              const Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              Container(
                  width: screenWidth,
                  height: screenHeight * 0.05,
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                    child: Stack(
                      children: [
                        TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          controller: controller,
                          onChanged: (text) {
                            setState(() {
                              searchText = text;
                            });
                          },
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Recherche',
                          ),
                        ),
                      ],
                    ),
                  )),
              const Divider(
                height: 2,
                thickness: 2,
                color: Colors.black,
              ),
              SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.65 - 11,
                  child: FutureBuilder<List<Contact>>(
                    future: getContact(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          if (snapshot.hasData) {
                            var item = snapshot.data?[index];
                            var contact = "${item?.firstname} ${item?.lastname}"
                                .toLowerCase();
                            if (contact.contains(searchText.toLowerCase())) {
                              return ListTile(
                                title: Text(
                                    "${item?.firstname} ${item?.lastname}"),
                                onTap: () {
                                  goToDetailsPage(context, item!);
                                },
                              );
                            } else {
                              return const SizedBox
                                  .shrink(); // Retourne un widget vide pour les éléments non correspondants
                            }
                          }
                          return null;
                        },
                      );
                    },
                  )),
              const Divider(
                height: 3,
                thickness: 3,
                color: Colors.black,
              ),
              const Footer(goHomePage: false, goAddPage: true)
            ])));
  }

  void search(String query) {
    /*final suggestions = list.where((contact) {
      final contactName =
          "${contact.lastname.toLowerCase()} ${contact.firstname.toLowerCase()}";
      final input = query.toLowerCase();

      return contactName.contains(input);
    }).toList();
    setState(() {
      listContact = suggestions;
    });*/
  }
}
