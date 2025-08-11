import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_users.dart';
import '../../../domain/usecases/create_user.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;
  final CreateUser createUser;

  UserBloc(this.getUsers, this.createUser) : super(UserInitial()) {
    on<GetUsersEvent>((event, emit) async {
      emit(UserLoading());

      try {
        final users = await getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<CreateUserEvent>((event, emit) async {
      emit(UserLoading());

      try {
        await createUser(event.payload);
        emit(const UserSuccess('User created successfully'));

        // Lanjutkan dengan load ulang data jika ingin
        final users = await getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
