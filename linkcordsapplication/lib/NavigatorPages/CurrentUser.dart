
// class Currentuserpost {
//   // ignore: non_constant_identifier_names
//   dynamic Description;
//   dynamic name;
//   dynamic pic;
//   dynamic location;
//   dynamic profilPic;
//   List connections = [];

//   Currentuserpost({
//     required this.Description,
//     required this.name,
//     required this.pic,
//     required this.profilPic,
//   });

//   static Map<String, dynamic> toMapData(
//     Currentuserpost obj,
//     String email,
//   ) {
//     obj.connections.add(email);

//     // log("---------------------${obj.connections[0]}");
//     return {
//       "Description": obj.Description,
//       "email": obj.name,
//       "bio": obj.pic,
//       "profilepic": obj.profilPic,
//     };
//   }
// }

class Currentuserpost {
  final String name;
  final String? pic;
  final String profilPic;
  final String Description;
  final String postId; // ✅ Add this

  Currentuserpost({
    required this.name,
    required this.pic,
    required this.profilPic,
    required this.Description,
    required this.postId, // ✅ Add this
  });

  factory Currentuserpost.fromMap(Map<String, dynamic> data, String id) {
    return Currentuserpost(
      name: data['name'],
      pic: data['pic'],
      profilPic: data['profilPic'],
      Description: data['Description'],
      postId: id, // ✅ Use document ID from Firestore
    );
  }
}
