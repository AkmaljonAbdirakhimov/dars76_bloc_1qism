import 'dart:convert';

import 'package:dars76_bloc_1qism/data/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoHttpService {
  final String baseUrl = "https://dars66-ae91b-default-rtdb.firebaseio.com";

  Future<List<Todo>> getTodos() async {
    Uri url = Uri.parse("$baseUrl/todos.json");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<Todo> todos = [];
        final data = jsonDecode(response.body);

        if (data != null) {
          data.forEach((key, value) {
            todos.add(
              Todo(
                id: key,
                title: value['title'],
                isDone: value['isDone'],
              ),
            );
          });
        }

        return todos;
      }
      throw ("Rejalar olishda xatolik");
    } catch (e) {
      rethrow;
    }
  }

  Future<Todo> addTodo(String title) async {
    Uri url = Uri.parse("$baseUrl/todos.json");

    try {
      final response = await http.post(
        url,
        body: jsonEncode(
          {
            "title": title,
            "isDone": false,
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return Todo(
          id: data['name'],
          title: title,
          isDone: false,
        );
      }

      throw ("Reja qo'shishda xatolik");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editTodo(String id, String newTitle) async {
    Uri url = Uri.parse("$baseUrl/todos/$id.json");

    try {
      final response = await http.patch(
        url,
        body: jsonEncode(
          {"title": newTitle},
        ),
      );

      if (response.statusCode != 200) {
        throw ("Reja o'zgartirishda xatolik");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTodo(String id) async {
    Uri url = Uri.parse("$baseUrl/todos/$id.json");

    try {
      final response = await http.delete(url);

      if (response.statusCode != 200) {
        throw ("Reja o'chirishda xatolik");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleTodo(String id, bool isDone) async {
    Uri url = Uri.parse("$baseUrl/todos/$id.json");

    try {
      final response = await http.patch(
        url,
        body: jsonEncode(
          {"isDone": isDone},
        ),
      );

      if (response.statusCode != 200) {
        throw ("Reja o'zgartirishda xatolik");
      }
    } catch (e) {
      rethrow;
    }
  }
}
