import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/base/payment_method.dart';

abstract class ReloadableMethod extends PaymentMethod {
  bool reload(double amount);
}
