import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';

extension UserModelMapper on UserModel {
  User toEntity() {
    return User(id: id, name: name, email: email, password: password);
  }
}

extension UserEntityMapper on User {
  UserModel toModel() {
    return UserModel(id: id, name: name, email: email, password: password);
  }
}
