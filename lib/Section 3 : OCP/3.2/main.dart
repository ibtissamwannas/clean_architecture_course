import 'package:clean_architecture_course/Section%203%20:%20OCP/3.2/file_logger.dart';
import 'package:clean_architecture_course/Section%203%20:%20OCP/3.2/logger.dart';
import 'package:clean_architecture_course/Section%203%20:%20OCP/3.2/user_service.dart';

void main() {
  final Logger logger = FileLogger('log.txt');
  final userService = UserService(logger);
  userService.createUser('Alice');
}
