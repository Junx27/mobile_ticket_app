import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPaymentEvent extends PaymentEvent {}
