import 'package:mobile_ticket_app/domain/entities/payment/payment_transaction.dart';
import 'package:mobile_ticket_app/domain/repositories/payment/payment_transaction_repository.dart';

class GetAllPaymentTransactions {
  final PaymentTransactionRepository repository;

  GetAllPaymentTransactions(this.repository);

  Future<List<PaymentTransaction>> call() async {
    return await repository.getAllPaymentTransactions();
  }
}
