import 'dart:io';

import 'package:mobile_ticket_app/domain/entities/payment/payment_transaction.dart';

abstract class PaymentTransactionRepository {
  Future<List<PaymentTransaction>> getAllPaymentTransactions();
}
