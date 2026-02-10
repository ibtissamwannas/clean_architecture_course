abstract class PaymentMethod {
  String get accountNumber;
  String get holderName;

  bool processPayment(double amount);
}
