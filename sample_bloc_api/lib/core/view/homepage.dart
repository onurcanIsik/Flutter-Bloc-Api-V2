import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_api/core/bloc/user_cubit.dart';
import 'package:sample_bloc_api/core/bloc/user_state.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Api"),
      ),
      body: Center(
        child: BlocBuilder<UserCubit, UserState>(builder: ((context, state) {
          if (state is UserLoading) {
            return const CircularProgressIndicator();
          } else if (state is UserError) {
            return Text(state.failure.message);
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item $index"),
                  subtitle: Text(state.userList[index].body.toString()),
                );
              },
            );
          }
          return const SizedBox.shrink();
        })),
      ),
    );
  }
}
