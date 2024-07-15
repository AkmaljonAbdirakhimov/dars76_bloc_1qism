import 'package:dars76_bloc_1qism/logic/cubits/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/todo_repository.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(
    this.todoRepository,
  ) : super(InitialTodoState());

  final TodoRepository todoRepository;

  void getTodos() async {
    emit(LoadingTodoState());
    try {
      final todos = await todoRepository.getTodos();
      emit(LoadedTodoState(todos));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }

  void addTodo(String title) async {
    final existingTodos = (state as LoadedTodoState).todos;

    try {
      emit(LoadingTodoState());
      final todo = await todoRepository.addTodo(title);

      existingTodos.add(todo);
      emit(LoadedTodoState(existingTodos));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }

  void editTodo(String id, String newTitle) async {
    final existingTodos = (state as LoadedTodoState).todos;

    try {
      emit(LoadingTodoState());
      await todoRepository.editTodo(id, newTitle);
      existingTodos.map((todo) {
        if (todo.id == id) {
          todo.title = newTitle;
        }
      });
      emit(LoadedTodoState(existingTodos));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }

  void deleteTodo(String id) async {
    final existingTodos = (state as LoadedTodoState).todos;

    try {
      emit(LoadingTodoState());
      await todoRepository.deleteTodo(id);
      existingTodos.removeWhere((todo) {
        return todo.id == id;
      });
      emit(LoadedTodoState(existingTodos));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }

  void toggleTodo(String id, bool isDone) async {
    final existingTodos = (state as LoadedTodoState).todos;

    try {
      for (var todo in existingTodos) {
        if (todo.id == id) {
          todo.isDone = isDone;
        }
      }
      emit(LoadedTodoState(existingTodos));
      await todoRepository.toggleTodo(id, isDone);
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }
}
