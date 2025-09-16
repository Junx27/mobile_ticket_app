class PaymentTransaction {
  final int id;
  final String account_name;
  final int account_number;
  final int amount;
  final String date;

  PaymentTransaction({
    required this.id,
    required this.account_name,
    required this.account_number,
    required this.amount,
    required this.date,
  });
}
