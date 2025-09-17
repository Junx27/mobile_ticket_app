import 'package:equatable/equatable.dart';
import 'package:mobile_ticket_app/domain/entities/payment/payment_transaction.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final List<PaymentTransaction> transactions;

  const PaymentLoaded(this.transactions);

  @override
  List<Object?> get props => [transactions];
}

class PaymentSuccess extends PaymentState {
  final String message;

  const PaymentSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class PaymentError extends PaymentState {
  final String message;

  const PaymentError(this.message);

  @override
  List<Object?> get props => [message];
}
