import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/base/refunduble_method.dart';

class CreditCard implements RefundubleMethod {
  CreditCard({
    required this.accountNumber,
    required this.holderName,
    required this.cvv,
    required this.expiryDate,
  });

  @override
  String accountNumber;

  @override
  String holderName;

  String cvv;
  String expiryDate;

  @override
  bool processPayment(double amount) {
    throw UnimplementedError();
  }

  @override
  bool processRefund(double amount) {
    throw UnimplementedError();
  }
}
