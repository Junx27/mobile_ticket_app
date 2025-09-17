import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ticket_app/domain/usecases/payment/get_all_payment_transactions.dart';
import 'package:mobile_ticket_app/presentation/bloc/payment/payment_event.dart';
import 'package:mobile_ticket_app/presentation/bloc/payment/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final GetAllPaymentTransactions getAllPaymentTransactions;

  PaymentBloc(this.getAllPaymentTransactions) : super(PaymentInitial()) {
    on<GetPaymentEvent>((event, emit) async {
      emit(PaymentLoading());

      try {
        final transactions = await getAllPaymentTransactions();
        emit(PaymentLoaded(transactions));
      } catch (e) {
        emit(PaymentError(e.toString()));
      }
    });
  }
}
