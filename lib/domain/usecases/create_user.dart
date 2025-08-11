import '../../domain/repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser(this.repository);

  Future<void> call(Map<String, dynamic> payload) {
    return repository.createUser(payload);
  }
}
