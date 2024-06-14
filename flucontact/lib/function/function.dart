import 'package:device_info/device_info.dart';
import 'package:flucontact/page/edit_page.dart';
import 'package:flucontact/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../class/contact.dart';
import '../page/details.dart';
import '../page/add_page.dart';
import '../page/register.dart';
import '../page/login.dart';
import 'services.dart';
import 'package:dio/dio.dart' as Dio;

void opendialog(String valid, Contact contact, BuildContext context) {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
              surfaceTintColor: Colors.white,
              title: Text(
                valid,
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                            MediaQuery.sizeOf(context).width * 0.3,
                            MediaQuery.sizeOf(context).height * 0.04))),
                    onPressed: () {
                      Navigator.pop(context);
                      if (valid == "Ajouter le contact ?") {
                        addContact(contact);
                        Navigator.of(context)
                            .push(_createRoute(-1, HomePage()));
                      } else if (valid == "Supprimer le contact ?") {
                        deleteContact(contact);
                        Navigator.of(context)
                            .push(_createRoute(-1, HomePage()));
                      } else {
                        editContact(contact);
                        Navigator.of(context).push(
                            _createRoute(-1, DetailsPage(contact: contact)));
                      }
                    },
                    child: const Text(
                      "Oui",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    )),
                TextButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                            MediaQuery.sizeOf(context).width * 0.3,
                            MediaQuery.sizeOf(context).height * 0.04))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Non",
                        style: TextStyle(
                          fontSize: 24,
                        )))
              ])));
}

Future<void> addContact(Contact contact) async {
  String? id = await getUserId();
  Dio.Response response = await dio().post('add-contact/$id', data: {
    'firstname': contact.firstname,
    'lastname': contact.lastname,
    'age': contact.age,
    'user_id': id,
  });
}

Future<void> deleteContact(Contact contact) async {
  Dio.Response response = await dio().delete('delete-contact/${contact.id}');
}

Future<bool> editContact(Contact contact) async {
  String? id = await getUserId();
  try {
    Dio.Response response =
        await dio().put('edit-contact/${contact.id}', data: {
      'firstname': contact.firstname,
      'lastname': contact.lastname,
      'age': contact.age,
      'user_id': id,
    });

    if (200 == response.statusCode) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<List<Contact>> getContact() async {
  String? id = await getUserId();
  Dio.Response response = await dio().get('contact/$id');
  List listcontact = response.data;
  return listcontact.map((contact) => Contact.fromJson(contact)).toList();
}

Future<void> removeAuthToken(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  Dio.Response response = await dio().delete(
    'auth/token',
  );
  preferences.remove('authToken');
  preferences.remove('user_id');
  goToLoginPage(context);
}

Future<bool> doesTokenExist() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.containsKey('authToken');
}

Future<String?> getAuthToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString('authToken');
}

Future<String?> getUserId() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString('user_id');
}

Future<void> loginUser(
    String email, String password, BuildContext context) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceName = 'Unknown';

  if (Theme.of(context).platform == TargetPlatform.iOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceName = iosInfo.name ?? 'Unknown';
  } else if (Theme.of(context).platform == TargetPlatform.android) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceName = androidInfo.model ?? 'Unknown';
  }

  Dio.Response response = await dio().post('login', data: {
    'email': email,
    'password': password,
    'device_name': deviceName,
  });
  if (response.statusCode == 201) {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('authToken', response.data['token']);
    preferences.setString('user_id', "${response.data['user_id']}");
    goToHomePage(context);
  }
}

void registerUser(String email, String username, String password,
    BuildContext context) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceName = 'Unknown';

  if (Theme.of(context).platform == TargetPlatform.iOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceName = iosInfo.name ?? 'Unknown';
  } else if (Theme.of(context).platform == TargetPlatform.android) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceName = androidInfo.model ?? 'Unknown';
  }
  Dio.Response response = await dio().post('register', data: {
    'email': email,
    'password': password,
    'login': username,
    'device_name': deviceName,
  });
  if (response.statusCode == 201) {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('authToken', response.data['token']);
    preferences.setString('user_id', "${response.data['user_id']}");
    goToHomePage(context);
  }
}

void goToAddPage(BuildContext context) {
  Navigator.of(context).push(_createRoute(1.0, const AddPage()));
}

void goToHomePage(BuildContext context) {
  Navigator.of(context).push(_createRoute(-1.0, const HomePage()));
}

void goToDetailsPage(BuildContext context, Contact contact) {
  Navigator.of(context).push(_createRoute(1.0, DetailsPage(contact: contact)));
}

void goToRegisterPage(BuildContext context) {
  Navigator.of(context).push(_createRoute(1.0, const RegisterPage()));
}

void goToLoginPage(BuildContext context) {
  Navigator.of(context).push(_createRoute(1.0, const LoginPage()));
}

void goToEditPage(BuildContext context, Contact contact) {
  Navigator.of(context).push(_createRoute(1.0, EditPage(contact: contact)));
}

Route _createRoute(double side, var page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(side, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
