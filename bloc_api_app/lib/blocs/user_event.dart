part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class ButtonPressedEvent extends UserEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
