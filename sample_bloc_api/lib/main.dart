import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_api/core/bloc/user_cubit.dart';
import 'package:sample_bloc_api/core/data/service/api_service.dart';
import 'package:sample_bloc_api/core/view/homepage.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(
            ApiRepo(apiService),
          )..fetchDataApi(),
        )
      ],
      child: const MaterialApp(
        home: Homepage(),
      ),
    );
  }
}
