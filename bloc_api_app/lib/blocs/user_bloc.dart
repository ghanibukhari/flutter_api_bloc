import 'package:bloc_api/models/user_model.dart';
import 'package:bloc_api/repositories/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository _apiRepository;

  UserBloc(this._apiRepository) : super(UserInitialState()) {
    on<ButtonPressedEvent>((event, emit) => callUserApi(event, emit));
  }

  callUserApi(ButtonPressedEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      final userList = await _apiRepository.fetchUserList();
      emit(UserSuccessState(userList!));
    } catch (e) {
      emit(UserFailureState(e.toString()));
    }
  }
}
