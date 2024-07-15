import '../../../data/models/todo.dart';

sealed class TodoState {}

final class InitialTodoState extends TodoState {}

final class LoadingTodoState extends TodoState {}

final class LoadedTodoState extends TodoState {
  final List<Todo> todos;

  LoadedTodoState(this.todos);
}

final class ErrorTodoState extends TodoState {
  final String message;

  ErrorTodoState(this.message);
}
