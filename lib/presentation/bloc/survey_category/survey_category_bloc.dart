import 'package:flutter_bloc/flutter_bloc.dart';
import 'survey_category_event.dart';
import 'survey_category_state.dart';
import '../../../domain/usecases/get_survey_category.dart';

class SurveyCategoryBloc
    extends Bloc<SurveyCategoryEvent, SurveyCategoryState> {
  final GetSurveyCategories getSurveyCategories;

  SurveyCategoryBloc(this.getSurveyCategories)
    : super(SurveyCategoryInitial()) {
    on<GetSurveyCategoriesEvent>((event, emit) async {
      emit(SurveyCategoryLoading());
      try {
        final surveyCategories = await getSurveyCategories();
        emit(SurveyCategoryLoaded(surveyCategories));
      } catch (e) {
        emit(SurveyCategoryError(e.toString()));
      }
    });
  }
}
