import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/email_service.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/email_validator.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/has_password.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_logger.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_model.dart';
import 'package:clean_architecture_course/Section%202%20:%20SRP/2.1/refactor/user_repo.dart';

class UserCreationService {
  final HasPassword _hasPassword;
  final EmailValidator _emailValidator;
  final EmailService _emailService;
  final UserLogger _userLogger;
  final UserRepo _userRepo;

  const UserCreationService(
    this._hasPassword,
    this._emailValidator,
    this._emailService,
    this._userLogger,
    this._userRepo,
  );

  void createUser(UserModel user) {
    if (_emailValidator.isValidEmail(user.email)) return;

    _hasPassword.hashPassword(user.password);
    _userRepo.saveToDatabase(user);
    _emailService.sendWelcomeEmail(user);
    _userLogger.logUserCreation(user);
  }
}
