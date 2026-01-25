import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_model.dart';

class UserLogger {
  void logUserCreation(UserModel user) {
    print('LOG: User ${user.name} created at ${DateTime.now()}');
  }
}
