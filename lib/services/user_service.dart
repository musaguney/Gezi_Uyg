import 'package:gezi_uygulamasi/models/user.dart';
import 'package:gezi_uygulamasi/repositories/repostory.dart';

class UserService {
  static UserService? _instance;
  static UserService get instance => _instance ??= UserService._init();
  UserService._init() {
    _repository = Repository();
  }

  Repository? _repository;

  User? currentUser;

  void setCurrentUser(User currentUserValue) {
    currentUser = currentUserValue;
  }

  Future<User> getUserById(int userId) async {
    final response = await _repository?.readDataById("users", userId);

    print(response);
    User user = User();
    if (response != null) {
      user.id = response[0]["id"];
      user.nameSurname = response[0]["nameSurname"];
      user.userName = response[0]["userName"];
      user.email = response[0]["email"];
    }

    return user;
  }
}
