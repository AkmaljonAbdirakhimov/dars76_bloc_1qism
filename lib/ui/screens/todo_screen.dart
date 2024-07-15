import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubits/todo/todo_cubit.dart';
import '../../logic/cubits/todo/todo_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      context.read<TodoCubit>().getTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rejalar"),
        actions: [
          IconButton.filled(
            onPressed: () {
              String title = "Yangi reja ${UniqueKey()}";

              context.read<TodoCubit>().addTodo(title);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (ctx, state) {
          if (state is LoadingTodoState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ErrorTodoState) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is LoadedTodoState) {
            return state.todos.isEmpty
                ? const Center(
                    child: Text("Rejalar mavjud emas"),
                  )
                : ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (ctx, index) {
                      final todo = state.todos[index];
                      return ListTile(
                        leading: IconButton(
                          onPressed: () {
                            context
                                .read<TodoCubit>()
                                .toggleTodo(todo.id, !todo.isDone);
                          },
                          icon: Icon(
                            todo.isDone
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                          ),
                        ),
                        title: Text(todo.title),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<TodoCubit>().deleteTodo(todo.id);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                // context.read<TodoCubit>().editTodo(id, newTitle);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          }

          return const Center(
            child: Text("Rejalar mavjud emas"),
          );
        },
      ),
    );
  }
}
