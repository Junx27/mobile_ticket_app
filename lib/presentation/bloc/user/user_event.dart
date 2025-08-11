import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUsersEvent extends UserEvent {}

class CreateUserEvent extends UserEvent {
  final Map<String, dynamic> payload;

  CreateUserEvent(this.payload);

  @override
  List<Object?> get props => [payload];
}
