import 'package:equatable/equatable.dart';

abstract class FollowerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFollowerEvent extends FollowerEvent {}
