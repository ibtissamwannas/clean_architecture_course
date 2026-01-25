class Order {
  String id;
  double total;
  List<String> items;

  Order({required this.id, required this.total, required this.items});
}

class OrderManager {}

class OrderValidator {
  bool isValidOrder(Order order) {
    return order.total > 0 && order.items.isNotEmpty;
  }
}

class TaxCalculator {
  double calculateTax(double subtotal) {
    return subtotal * 0.08;
  }
}

class OrderRepo {
  void saveOrder(Order order) {
    print('Saving to database...');
  }
}

class EmailService {
  void sendConfirmationEmail(Order order) {
    print('Sending email...');
  }
}

class InvoiceGenerator {
  void generateInvoice(Order order) {
    print('Generating PDF...');
  }
}

class OrderService {
  const OrderService({
    required this.orderValidator,
    required this.taxCalculator,
    required this.orderRepo,
    required this.emailService,
    required this.invoiceGenerator,
  });
  final OrderValidator orderValidator;
  final TaxCalculator taxCalculator;
  final OrderRepo orderRepo;
  final EmailService emailService;
  final InvoiceGenerator invoiceGenerator;

  void processOrder(Order order) {
    if (!orderValidator.isValidOrder(order)) return;

    final tax = taxCalculator.calculateTax(order.total);
    orderRepo.saveOrder(order);
    emailService.sendConfirmationEmail(order);
    invoiceGenerator.generateInvoice(order);
  }
}

void main() {
  final manager = OrderService(
    orderValidator: OrderValidator(),
    taxCalculator: TaxCalculator(),
    orderRepo: OrderRepo(),
    emailService: EmailService(),
    invoiceGenerator: InvoiceGenerator(),
  );
  final order = Order(id: 'ORD-001', total: 100.0, items: ['Item1']);

  // One class doing everything - messy!
  if (manager.orderValidator.isValidOrder(order)) {
    final tax = manager.taxCalculator.calculateTax(92.59);
    manager.orderRepo.saveOrder(order);
    manager.emailService.sendConfirmationEmail(order);
    manager.invoiceGenerator.generateInvoice(order);
  }
}
