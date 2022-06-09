class User {
  int? id;
  String? nameSurname;
  String? userName;
  String? email;
  String? password;

  User({
    this.id,
    this.nameSurname,
    this.userName,
    this.email,
    this.password,
  });

  userMap() {
    var mapping = <String, dynamic>{};
    mapping['nameSurname'] = nameSurname;
    mapping['userName'] = userName;
    mapping['email'] = email;
    mapping['password'] = password;
    return mapping;
  }

  @override
  String toString() {
    return 'User(id: $id, nameSurname: $nameSurname, userName: $userName, email: $email, password: $password)';
  }
}
