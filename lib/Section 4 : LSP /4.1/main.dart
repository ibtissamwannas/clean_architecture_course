import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/base/payment_method.dart';
import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/base/refunduble_method.dart';
import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/base/reloadable_method.dart';
import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/payment/bank_account.dart';
import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/payment/credit_card.dart';
import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.1/payment/gift_card.dart';

void processRefund(RefundubleMethod paymentMethod, double amount) {
  print('\n--- Processing return of \$$amount ---');
  paymentMethod.processRefund(amount);
}

void processReload(ReloadableMethod paymentMethod, double amount) {
  print('\n--- Processing reload of \$$amount ---');
  paymentMethod.reload(amount);
}

void processPayment(PaymentMethod paymentMethod, double amount) {
  print('\n--- Processing payment of \$$amount ---');
  paymentMethod.processPayment(amount);
}

void main() {
  final RefundubleMethod creditCard = CreditCard(
    accountNumber: '4532123456789012',
    holderName: 'John Doe',
    cvv: '123',
    expiryDate: '12/25',
  );

  final RefundubleMethod bankAccount = BankAccount(
    accountNumber: '123456789',
    holderName: 'Jane Smith',
    bankName: 'ABC Bank',
    routingNumber: '987654321',
  );

  final ReloadableMethod giftCard = GiftCard(
    balance: 50.0,
    accountNumber: '',
    holderName: 'Gift Card',
  );

  processRefund(creditCard, 29.99);

  processRefund(bankAccount, 49.99);

  processReload(giftCard, 19.99);
}
