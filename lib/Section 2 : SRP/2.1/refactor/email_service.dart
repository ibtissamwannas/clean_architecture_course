import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_model.dart';

class EmailService {
  void sendWelcomeEmail(UserModel user) {
    print('Sending welcome email to ${user.email}...');
  }
}
