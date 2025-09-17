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
    final List<Map<String, dynamic>> dummyData = [
      {
        'id': 1,
        'account_name': 'Test User',
        'account_number': 1223,
        'amount': 11000,
        'date': '2025-09-09',
      },
      {
        'id': 2,
        'account_name': 'Budi',
        'account_number': 4556,
        'amount': 25000,
        'date': '2025-09-12',
      },
    ];

    return dummyData
        .map((json) => PaymentTransactionModel.fromJson(json))
        .toList();

    /*
    final response = await client.get(
      Uri.parse('https://api.example.com/payment-transactions'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body
          .map((json) => PaymentTransactionModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load payment transactions');
    }
    */
  }
}
