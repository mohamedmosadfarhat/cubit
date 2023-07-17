import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../todocubit/do_cubit.dart';
import '../../todocubit/do_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   getTodos();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoCubit()..getTodo(),
      child: BlocConsumer<TodoCubit,TodoState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = TodoCubit.get(context);
          return ListView.builder(
            itemBuilder: (context , index) {
              return ListTile(
                title: Text(cubit.todos[index].title??"--"),
                trailing: TextButton(

                  onPressed: () {  },
                  child: Text(
                      cubit.todos[index].completed.toString()),),
              );
            },
            itemCount: cubit.todos.length,
          );
        },
      ),
    );
  }
}
