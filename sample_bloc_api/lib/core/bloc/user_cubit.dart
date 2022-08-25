// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_api/core/bloc/user_state.dart';
import 'package:sample_bloc_api/core/data/service/api_service.dart';
import 'package:sample_bloc_api/core/model/user_failure.dart';
import 'package:sample_bloc_api/core/model/user_model.dart';

class UserCubit extends Cubit<UserState> {
  final ApiRepo _apiRepo;
  UserCubit(this._apiRepo) : super(UserInitial());

  Future<void> fetchDataApi() async {
    emit(UserLoading());

    try {
      final List<User>? userList = await _apiRepo.getUserList();

      emit(UserLoaded(userList ?? []));
    } on Failure catch (x) {
      emit(UserError(x));
    } catch (e) {
      print(e);
    }
  }
}
