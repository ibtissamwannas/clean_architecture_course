import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_model.dart';

class UserRepo {
  void saveToDatabase(UserModel user) {
    print('Saving user ${user.name} to database...');
  }
}
