import 'package:flutter_bloc/flutter_bloc.dart';
import 'survey_event.dart';
import 'survey_state.dart';
import '../../../domain/usecases/get_survey.dart';
import '../../../domain/usecases/get_survey_by_id.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final GetSurveys getSurveys;
  final GetSurveyById getSurveyById;

  SurveyBloc(this.getSurveys, this.getSurveyById) : super(SurveyInitial()) {
    on<GetSurveysEvent>((event, emit) async {
      emit(SurveyLoading());
      try {
        final surveys = await getSurveys(
          categoryId: event.categoryId,
          name: event.name,
        );
        emit(SurveyLoaded(surveys, selectedCategoryId: event.categoryId));
      } catch (e) {
        emit(SurveyError(e.toString()));
      }
    });

    on<GetSurveyByIdEvent>((event, emit) async {
      emit(SurveyLoading());
      try {
        final survey = await getSurveyById(event.id);
        emit(SingleSurveyLoaded(survey));
      } catch (e) {
        emit(SurveyError(e.toString()));
      }
    });
  }
}
