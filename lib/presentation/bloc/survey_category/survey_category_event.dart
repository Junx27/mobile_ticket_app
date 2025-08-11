import 'package:equatable/equatable.dart';

abstract class SurveyCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSurveyCategoriesEvent extends SurveyCategoryEvent {}
