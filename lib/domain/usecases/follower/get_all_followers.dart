import 'package:mobile_ticket_app/domain/entities/follower/follower.dart';
import 'package:mobile_ticket_app/domain/repositories/follower/follower_repository.dart';

class GetAllFollowers {
  final FollowerRepository repository;

  GetAllFollowers(this.repository);

  Future<List<Follower>> call() async {
    return await repository.getAllFollowers();
  }
}
