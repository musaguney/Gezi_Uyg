import 'package:gezi_uygulamasi/models/user.dart';

import '../repositories/repostory.dart';

class AuthService {
  Repository? _repository;
  AuthService() {
    _repository = Repository();
  }

  registerUser(User user) async {
    return await _repository?.insertData('users', user.userMap());
  }

  readUsers() async {
    return await _repository?.readData('users');
  }

  readUserByUserName(userName) async {
    return await _repository?.readDataByProperty('users', "userName", userName);
  }

}
