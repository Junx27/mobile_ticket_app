import 'dart:io';
import 'package:mobile_ticket_app/domain/entities/payment/payment_transaction.dart';
import 'package:mobile_ticket_app/data/sources/payment/payment_transaction_remote_data_source.dart';
import 'package:mobile_ticket_app/domain/repositories/payment/payment_transaction_repository.dart';

class PaymentTransactionRepositoryImpl implements PaymentTransactionRepository {
  final PaymentTransactionRemoteDataSource remoteDataSource;

  PaymentTransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PaymentTransaction>> getAllPaymentTransactions() async {
    try {
      final models = await remoteDataSource.getAllPaymentTransactions();

      return models
          .map(
            (e) => PaymentTransaction(
              id: e.id,
              account_name: e.account_name,
              account_number: e.account_number,
              amount: e.amount,
              date: e.date,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to get payment transactions: $e');
    }
  }
}
