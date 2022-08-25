import 'package:equatable/equatable.dart';
import 'package:sample_bloc_api/core/model/user_failure.dart';
import 'package:sample_bloc_api/core/model/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoaded extends UserState {
  final List<User> userList;

  UserLoaded(this.userList);

  @override
  List<Object?> get props => [userList];
}

class UserError extends UserState {
  UserError(this.failure);

  @override
  List<Object?> get props => [failure];

  final Failure failure;
}
