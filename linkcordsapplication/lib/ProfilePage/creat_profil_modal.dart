
class CreatProfilModal {
  // ignore: non_constant_identifier_names
  dynamic usreName;
  dynamic email;
  dynamic bio;
  dynamic location;
  dynamic profilPic;
  List connections = [];

  CreatProfilModal({
    required this.usreName,
    required this.email,
    required this.bio,
    required this.location,
    required this.profilPic,
    required this.connections,
  });

  static Map<String, dynamic> toMapData(
    CreatProfilModal obj,
    // String email,
    String userName,
  ) {
    // obj.connections.add(email);
    obj.connections.add(userName);

    // log("---------------------${obj.connections[0]}");
    return {
      "UserName": obj.usreName,
      "userEmailid": obj.email,
      "bio": obj.bio,
      "location": obj.location,
      "profilpic": obj.profilPic,
      "connections": obj.connections
    };
  }
}
