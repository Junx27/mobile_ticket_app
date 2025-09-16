import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobile_ticket_app/data/models/payment/payment_transaction_model.dart';

abstract class PaymentTransactionRemoteDataSource {
  Future<List<PaymentTransactionModel>> getAllPaymentTransactions();
}

class PaymentTransactionRemoteDataSourceImpl
    implements PaymentTransactionRemoteDataSource {
  final http.Client client;
  PaymentTransactionRemoteDataSourceImpl({http.Client? client})
    : client = client ?? http.Client();

  @override
  Future<List<PaymentTransactionModel>> getAllPaymentTransactions() async {
    final List<dynamic> body = [
      {
        'id': 1,
        'account_name': 'test',
        'account_number': 1223,
        'amount': 11,
        'date': '2025-09-09',
      },
    ];

    return body.map((json) => PaymentTransactionModel.fromJson(json)).toList();
  }
}
