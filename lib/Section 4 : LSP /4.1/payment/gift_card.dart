import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/base/reloadable_method.dart';

class GiftCard implements ReloadableMethod {
  GiftCard({
    required this.accountNumber,
    required this.holderName,
    required this.balance,
  });
  @override
  String accountNumber;

  @override
  String holderName;

  double balance;

  @override
  bool processPayment(double amount) {
    if (amount > balance) {
      print('Insufficient balance on gift card');
      return false;
    }
    balance -= amount;
    print('Paid \$$amount using gift card. Remaining balance: \$$balance');
    return true;
  }

  @override
  bool reload(double amount) {
    balance += amount;
    print('Gift card reloaded with \$$amount. New balance: \$$balance');
    return true;
  }
}
