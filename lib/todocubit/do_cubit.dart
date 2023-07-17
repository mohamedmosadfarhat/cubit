import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todos_model.dart';
import '../services/todos_service.dart';
import 'do_state.dart';
class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(InitialState()) {
    getTodo();
  }

  static TodoCubit get(context) => BlocProvider.of(context);

  List<Temperatures> todos = [];
  bool isLoading = true;

  getTodo() async {
    emit(LoadingState());
    try {
      todos = await TodosService().getTodosData();
      isLoading = false;

      emit(SuccessState());
    } catch (e) {
      print(e.toString());
      emit(ErrorState());
    }
  }
}