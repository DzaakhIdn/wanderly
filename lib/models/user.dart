class UserModel {
  final String uid;
  final String email;
  final String username;
  final String gender;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {"uid": uid, "email": email, "username": username, "gender": gender};
  }
}
