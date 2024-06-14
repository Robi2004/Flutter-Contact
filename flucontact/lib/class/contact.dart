class Contact {
  String? id;
  String? lastname;
  String? firstname;
  String? age;

  Contact({this.id, this.firstname, this.lastname, this.age});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        id: json['id'].toString(),
        lastname: json['lastname'].toString(),
        firstname: json['firstname'].toString(),
        age: json['age'].toString());
  }
}
