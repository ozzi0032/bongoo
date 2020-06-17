class UserModel {
  String userId;
  String fname;
  String lname;
  String email;
  String contactNumber;
  UserModel(
      {this.userId, this.fname, this.lname, this.email, this.contactNumber});

  toJSON(UserModel obj) {
    final data = obj.toMap();
    return data;
  }

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'firstName': fname,
        'lastName': lname,
        'emailAddress': email,
        'contactNumber': contactNumber,
      };
}
