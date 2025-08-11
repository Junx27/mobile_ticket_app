import '../../data/models/survey_model.dart';
import '../../domain/entities/survey.dart';

class SurveyMapper {
  static Survey toEntity(SurveyModel model) {
    return Survey(
      id: model.id,
      name: model.name,
      image: model.image,
      price: model.price,
      description: model.description,
      category: model.category,
    );
  }

  static SurveyModel toModel(Survey entity) {
    return SurveyModel(
      id: entity.id,
      name: entity.name,
      image: entity.image,
      price: entity.price,
      description: entity.description,
      category: entity.category,
    );
  }

  static List<Survey> toEntityList(List<SurveyModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }

  static List<SurveyModel> toModelList(List<Survey> entities) {
    return entities.map((entity) => toModel(entity)).toList();
  }
}
