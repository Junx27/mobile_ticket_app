import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ticket_app/domain/usecases/follower/get_all_followers.dart';
import 'package:mobile_ticket_app/presentation/bloc/follower/follower_event.dart';
import 'package:mobile_ticket_app/presentation/bloc/follower/follower_state.dart';

class FollowerBloc extends Bloc<FollowerEvent, FollowerState> {
  final GetAllFollowers getAllFollowers;

  FollowerBloc(this.getAllFollowers) : super(FollowerInitial()) {
    on<GetFollowerEvent>((event, emit) async {
      emit(FollowerLoading());

      try {
        final followers = await getAllFollowers();
        emit(FollowerLoaded(followers));
      } catch (e) {
        emit(FollowerError(e.toString()));
      }
    });
  }
}
