import 'package:dars76_bloc_1qism/data/models/todo.dart';
import 'package:dars76_bloc_1qism/services/todo_http_service.dart';

class TodoRepository {
  TodoRepository(this.todoHttpService);

  final TodoHttpService todoHttpService;

  Future<List<Todo>> getTodos() async {
    return todoHttpService.getTodos();
  }

  Future<Todo> addTodo(String title) async {
    return todoHttpService.addTodo(title);
  }

  Future<void> editTodo(String id, String newTitle) async {
    await todoHttpService.editTodo(id, newTitle);
  }

  Future<void> deleteTodo(String id) async {
    await todoHttpService.deleteTodo(id);
  }

  Future<void> toggleTodo(String id, bool isDone) async {
    await todoHttpService.toggleTodo(id, isDone);
  }
}
