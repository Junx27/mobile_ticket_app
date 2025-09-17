import 'package:equatable/equatable.dart';
import 'package:mobile_ticket_app/domain/entities/follower/follower.dart';

abstract class FollowerState extends Equatable {
  const FollowerState();

  @override
  List<Object?> get props => [];
}

class FollowerInitial extends FollowerState {}

class FollowerLoading extends FollowerState {}

class FollowerLoaded extends FollowerState {
  final List<Follower> followers;

  const FollowerLoaded(this.followers);

  @override
  List<Object?> get props => [followers];
}

class FollowerSuccess extends FollowerState {
  final String message;

  const FollowerSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class FollowerError extends FollowerState {
  final String message;

  const FollowerError(this.message);

  @override
  List<Object?> get props => [message];
}
