import 'package:equatable/equatable.dart';
import '../../../domain/entities/survey_category.dart';

abstract class SurveyCategoryState extends Equatable {
  const SurveyCategoryState();

  @override
  List<Object?> get props => [];
}

class SurveyCategoryInitial extends SurveyCategoryState {}

class SurveyCategoryLoading extends SurveyCategoryState {}

class SurveyCategoryLoaded extends SurveyCategoryState {
  final List<SurveyCategory> surveyCategories;

  const SurveyCategoryLoaded(this.surveyCategories);

  @override
  List<Object?> get props => [surveyCategories];
}

class SingleSurveyCategoryLoaded extends SurveyCategoryState {
  final SurveyCategory surveyCategory;

  const SingleSurveyCategoryLoaded(this.surveyCategory);

  @override
  List<Object?> get props => [surveyCategory];
}

class SurveyCategoryError extends SurveyCategoryState {
  final String message;

  const SurveyCategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
