import 'package:dio/dio.dart';

import '../models/todos_model.dart';

class TodosService
{
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<Temperatures>> getTodosData()async
  {
    List<Temperatures> todosList = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((jsonElement)
    {
      Temperatures todos = Temperatures.fromJson(jsonElement);
      todosList.add(todos);
    });
    return todosList;
  }
}