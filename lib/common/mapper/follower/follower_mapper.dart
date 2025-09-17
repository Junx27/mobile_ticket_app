import 'package:mobile_ticket_app/data/models/follower/follower_model.dart';
import 'package:mobile_ticket_app/domain/entities/follower/follower.dart';

class FollowerMapper {
  static Follower toEntity(FollowerModel model) {
    return Follower(id: model.id, name: model.name, avatar: model.avatar);
  }

  static FollowerModel toModel(Follower entity) {
    return FollowerModel(
      id: entity.id,
      name: entity.name,
      avatar: entity.avatar,
    );
  }

  static List<Follower> toEntityList(List<FollowerModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }

  static List<FollowerModel> toModelList(List<Follower> entities) {
    return entities.map((entity) => toModel(entity)).toList();
  }
}
