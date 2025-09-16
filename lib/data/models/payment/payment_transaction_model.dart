class PaymentTransactionModel {
  final int id;
  final String account_name;
  final int account_number;
  final int amount;
  final String date;

  PaymentTransactionModel({
    required this.id,
    required this.account_name,
    required this.account_number,
    required this.amount,
    required this.date,
  });

  factory PaymentTransactionModel.fromJson(Map<String, dynamic> json) {
    return PaymentTransactionModel(
      id: json['id'],
      account_name: json['account_name'],
      account_number: json['account_number'],
      amount: json['amount'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account_name': account_name,
      'account_number': account_number,
      'amount': amount,
      'date': date,
    };
  }
}
