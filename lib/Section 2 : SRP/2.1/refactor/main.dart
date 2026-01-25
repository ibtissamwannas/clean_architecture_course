import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/email_service.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/email_validator.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/has_password.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_creation_service.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_logger.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_model.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_repo.dart';

void main() {
  final user = UserCreationService(
    HasPassword(),
    EmailValidator(),
    EmailService(),
    UserLogger(),
    UserRepo(),
  );
  user.createUser(
    UserModel(name: "name", email: "email", password: "password"),
  );
}
