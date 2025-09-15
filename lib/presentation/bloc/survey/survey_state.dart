import 'package:equatable/equatable.dart';
import '../../../domain/entities/survey.dart';

abstract class SurveyState extends Equatable {
  const SurveyState();

  @override
  List<Object?> get props => [];
}

class SurveyInitial extends SurveyState {}

class SurveyLoading extends SurveyState {}

class SurveyLoaded extends SurveyState {
  final List<Survey> surveys;
  final int? selectedCategoryId;

  const SurveyLoaded(this.surveys, {this.selectedCategoryId});

  @override
  List<Object?> get props => [surveys, selectedCategoryId];
}

class SingleSurveyLoaded extends SurveyState {
  final Survey survey;

  const SingleSurveyLoaded(this.survey);

  @override
  List<Object?> get props => [survey];
}

class SurveyError extends SurveyState {
  final String message;

  const SurveyError(this.message);

  @override
  List<Object?> get props => [message];
}

// survey_state.dart
class SurveyCreated extends SurveyState {
  final String message;
  SurveyCreated(this.message);

  @override
  List<Object?> get props => [message];
}
