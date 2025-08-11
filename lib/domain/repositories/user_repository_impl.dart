import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../data/sources/user_remote_data_source.dart';
import '../../data/models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<User>> getUsers() async {
    final List<UserModel> result = await remoteDataSource.getUsers();

    return result
        .map(
          (userModel) => User(
            id: userModel.id,
            name: userModel.name,
            email: userModel.email,
            password: userModel.password,
          ),
        )
        .toList();
  }

  @override
  Future<void> createUser(Map<String, dynamic> payload) {
    return remoteDataSource.createUser(payload);
  }
}
