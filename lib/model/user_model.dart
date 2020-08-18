class UserModel {
  String bellId;
  String userId;
  String email;
  String password;
  UserModel({this.bellId, this.userId, this.email, this.password});

  toJSON(UserModel obj) {
    final data = obj.toMap();
    return data;
  }

  Map<String, dynamic> toMap() => {
        'bellId': bellId,
        'userId': userId,
        'emailAddress': email,
        'password': password,
      };
}
