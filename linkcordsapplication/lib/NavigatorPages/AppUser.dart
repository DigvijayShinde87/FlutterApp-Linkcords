class AppUser {
  final String Username;
  final String Userpass;
  final String Useremailid;
  final String Userprofileurl;
  final String Userbio;
  final String UserLocation;

  AppUser(
      {required this.Username,
      required this.Userpass,
      required this.Useremailid,
      required this.Userbio,
      required this.Userprofileurl,
      required this.UserLocation});

  Map<String, dynamic> UserData() {
    return {
      "UserName": Username,
      "UserPassword": Userpass,
      "userEmailid": Useremailid,
      "profilepic": Userprofileurl,
      "bio": Userbio,
      "location": UserLocation
    };
  }
}
