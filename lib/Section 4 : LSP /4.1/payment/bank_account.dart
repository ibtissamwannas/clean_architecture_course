import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/base/refunduble_method.dart';

class BankAccount implements RefundubleMethod {
  BankAccount({
    required this.accountNumber,
    required this.holderName,
    required this.bankName,
    required this.routingNumber,
  });

  @override
  String accountNumber;

  @override
  String holderName;

  String bankName;
  String routingNumber;

  @override
  bool processPayment(double amount) {
    print('Withdrawing \$$amount from $bankName account: $accountNumber');
    return true;
  }

  @override
  bool processRefund(double amount) {
    print(
      'Depositing refund of \$$amount to $bankName account: $accountNumber',
    );
    return true;
  }
}
