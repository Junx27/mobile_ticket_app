import 'package:mobile_ticket_app/data/models/payment/payment_transaction_model.dart';
import 'package:mobile_ticket_app/domain/entities/payment/payment_transaction.dart';

class PaymentTransactionMapper {
  static PaymentTransaction toEntity(PaymentTransactionModel model) {
    return PaymentTransaction(
      id: model.id,
      account_name: model.account_name,
      account_number: model.account_number,
      amount: model.amount,
      date: model.date,
    );
  }

  static PaymentTransactionModel toModel(PaymentTransaction entity) {
    return PaymentTransactionModel(
      id: entity.id,
      account_name: entity.account_name,
      account_number: entity.account_number,
      amount: entity.amount,
      date: entity.date,
    );
  }

  static List<PaymentTransaction> toEntityList(
    List<PaymentTransactionModel> models,
  ) {
    return models.map((model) => toEntity(model)).toList();
  }

  static List<PaymentTransactionModel> toModelList(
    List<PaymentTransaction> entities,
  ) {
    return entities.map((enitity) => toModel(enitity)).toList();
  }
}
