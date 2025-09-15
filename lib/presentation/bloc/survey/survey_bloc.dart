import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ticket_app/domain/usecases/create_survey.dart';
import 'survey_event.dart';
import 'survey_state.dart';
import '../../../domain/usecases/get_survey.dart';
import '../../../domain/usecases/get_survey_by_id.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final GetSurveys getSurveys;
  final GetSurveyById getSurveyById;
  final CreateSurvey createSurvey;

  SurveyBloc(this.getSurveys, this.getSurveyById, this.createSurvey)
    : super(SurveyInitial()) {
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

    on<CreateSurveyEvent>((event, emit) async {
      emit(SurveyLoading());
      try {
        final result = await createSurvey(
          name: event.name,
          price: event.price,
          description: event.description,
          imageFile: event.imageFile, // ✅ pakai File, bukan String
          categoryId: event.categoryId,
        );
        emit(SurveyCreated("Survey berhasil dibuat"));
      } catch (e) {
        emit(SurveyError(e.toString()));
      }
    });
  }
}
