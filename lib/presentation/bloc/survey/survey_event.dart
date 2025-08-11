import 'package:equatable/equatable.dart';

abstract class SurveyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSurveysEvent extends SurveyEvent {
  final int? categoryId;
  final String? name;

  GetSurveysEvent({this.categoryId, this.name});
  @override
  List<Object?> get props => [categoryId, name];
}

class GetSurveyByIdEvent extends SurveyEvent {
  final int id;

  GetSurveyByIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}
