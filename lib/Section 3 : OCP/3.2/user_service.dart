import 'package:clean_architecture_course/Section%203%20:%20OCP/3.2/logger.dart';

class UserService {
  final Logger _logger;

  UserService(this._logger);

  void createUser(String username) {
    print('Creating user: $username');

    _logger.log('User created: $username');
  }

  void deleteUser(String username) {
    print('Deleting user: $username');
    _logger.log('User deleted: $username');
  }
}
